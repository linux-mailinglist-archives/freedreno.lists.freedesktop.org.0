Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A44EB67D
	for <lists+freedreno@lfdr.de>; Wed, 30 Mar 2022 01:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF9F10EF99;
	Tue, 29 Mar 2022 23:09:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EABF10EF95
 for <freedreno@lists.freedesktop.org>; Tue, 29 Mar 2022 23:09:55 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id p25so15371042qkj.10
 for <freedreno@lists.freedesktop.org>; Tue, 29 Mar 2022 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
 b=w8xu9XnmFHc5caQlAGfwzcIkBfTpogJyC/Z8FpIG+9cIP3gR2zRYtoUaWiHzPZuBsG
 HQneZzTbvoXPu2yMmtyeQNis5QeWwbocvt4HHrIwN1RV7UyzTATwZqwmcVPtC3dwZslc
 9PIYisICUth6zmHVftQ0am2evsMdXpXbWvEdj0OMz2hq3Z69aKjuLLiB6H1NHl8H61pt
 DxIR5dTh4zN8XlngUUjGIa8DNvHTNSNAmPEAIF/kooUnJlwwjGwjm5vQgiu93BCwCMln
 DoFcFIGw+hHrOX0v52ma/X2KnyWqF/28Q3ofS1EWuLHZpJ6K3IsfC17RX2fsgBu/RWf8
 uOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEhUDD4h6uAblZYdEqK3WfYH78cRJFucwHHJvJpj9po=;
 b=h75f3QaOwqxMr454VqPqxgaOZnc0LBY/FiPhFm6SqfJygQtJl3SkNMyfyccCC+hcIL
 levNJzC8EhUB6sMxhuizP2JJgCWwYJ2uxZ8Mty3HkZ8bpRfbrrY36PltIGfBeU1DUiaP
 79ZJ3Gp5umzenx9QqOHcNMRmWlgV5Epz9o4dwizGjft6C/bEUbv+GND1XvXa0wlFVFcX
 C6ow6BmFJkWog9MtmpYYD1a3fQzV7JcIxydTTDZMXVsLZzSyIFnTTSy/q4SVWNABxwlt
 9gllRrgKqDK0/MpOt2e4uDXXmOe9gdHdmW/7qIZ1wdYHsUAy56fifS5yiBJSfaN07dmz
 +IXg==
X-Gm-Message-State: AOAM531Y/v10e6zTwZUhxo6blRHDdCwmzUV8Q56MuJ6P5YXHaaPYHrfN
 cXg8VA5pSU/+N+uh3XD6knIdS0Xi4PS0SudBhw4RBA==
X-Google-Smtp-Source: ABdhPJyLdObA37xboAWKWrjWol8cD8HdyMOGLCYHULnJO8ksydrxdWJIytU1sr7bpMvVWokokD9NAS8l5HilJGmwql4=
X-Received: by 2002:a05:620a:2442:b0:67f:65f6:bad2 with SMTP id
 h2-20020a05620a244200b0067f65f6bad2mr22390896qkn.203.1648595394698; Tue, 29
 Mar 2022 16:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220329230105.601666-1-robdclark@gmail.com>
 <20220329230105.601666-2-robdclark@gmail.com>
In-Reply-To: <20220329230105.601666-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Mar 2022 02:09:43 +0300
Message-ID: <CAA8EJpqnS1qJS9CkR6s7nBSJcfL=i-gvX+PSpajoQOK6FmuWjg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/9] drm/msm/gem: Move prototypes
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 02:00, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> These belong more cleanly in the gem header.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
