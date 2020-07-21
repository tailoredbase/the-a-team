package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGetAnswer(t *testing.T) {
	assert.Equal(t, "answer", getAnswer())
}
