package controllers

import (
	"github.com/hfm/junkpod/go/test-echo-scaffold/helpers"
	"github.com/hfm/junkpod/go/test-echo-scaffold/models"
	"github.com/labstack/echo"
)

func findTaskByID(c echo.Context) (*models.Task, *helpers.ResponseError) {
	c.Request().ParseForm()

	task, _ := models.FindOneTaskByID(c.Param("task_id"))
	if task == nil {
		return nil, ErrTaskNotFound
	}

	return task, nil
}

// vi:syntax=go
