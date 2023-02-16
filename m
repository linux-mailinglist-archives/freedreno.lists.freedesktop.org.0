Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADC698A7C
	for <lists+freedreno@lfdr.de>; Thu, 16 Feb 2023 03:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97C010E2BA;
	Thu, 16 Feb 2023 02:23:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D073610E2BA
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 02:23:50 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id l201so576921ybf.10
 for <freedreno@lists.freedesktop.org>; Wed, 15 Feb 2023 18:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
 b=wlNPmA17KOY6pK6YSw5++8aMVTR+4h8QzLMUDAs/l/GgEN8eLFJjblVBAL4l+8UMVo
 VTNvpLOPQe0tCs8ZSBaPmCUh9VK2S35jr9LXhVu57g0MVbUxlVvoBO80fVRTxB/I/RIx
 +akHOGbDrVDLObPLO141W2tYDUHhJog0ukTM/eLTBFppp3LXIP16krE2YUTVKv6nVvB5
 DD3wYChintddtUpp8K+Y/2dZp6OviOiV3/Z2H0iulxFADBwcqMao8Um8A8dyZonyUOaN
 VjBCHyPX3eNae7TtWuiXWoU1BLix/mjHbA701x837guejw8xRKnxIaw7zAdnQbzpzTlX
 e+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
 b=naT4LERbg7cTfLMocmD0J5KYVTWJJELjyly4yCKAZE5HmH+POwmAQtUFZi3gr9765y
 Hpi8yCXOWEG7o8wjH665FcmS1A0i0Hv/RGS2z7RhyO+FL50Ta5gTnEobKuLeAJ2ADviN
 Lsw+BTAvCHYlkioqJzVL99F5PU3L6xvtFTUKIIuuAl+bslNZo8eCnnK4eQuGAMkFN3YW
 Jo46UrbPbCcuRLyXlXxVClfY/Iztqa+vQ9eloLeYvjLAbYS3/hfJR3Y/NJp2F7n4DNPd
 4Qjj+f/q4Qj9gQfWGIPIv+tj1Z9XdOz+M/ldW0qda9ztNVCYdQv+ml7gLtVekJ8g1RV8
 JElA==
X-Gm-Message-State: AO0yUKXgNbMa3HvvX9Re5whDG3oA6GuOHl3Adkj3jODv7LpM179OUcv5
 cSYm2Ou2TzqPukuKBeKeDE1NDgJ5D2ZIFgHGEQUKOw==
X-Google-Smtp-Source: AK7set+g5Iz6F+qTqpXxLN+bqfm0nIW/gdEpwcM8ofiNU5qAy9sZmhZSKBYet6qwAIKNsRoqh0H5TZPmCHA79wcHMxk=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr520370ybo.382.1676514229770; Wed, 15 Feb
 2023 18:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 04:23:38 +0200
Message-ID: <CAA8EJpr7v4waXaaahuMq3Ti18Gd-sg4HGSSof=yEX5kC7+CKnA@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: Drop unused get_scaler_ver
 callback from SSPP
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> This pointer callback is never used and should be removed.  The helper
> _dpu_hw_sspp_get_scaler3_ver function is retained as it is being used by
> dpu_hw_sspp_init which didn't itself compute _sspp_subblk_offset yet.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 6 ------
>  2 files changed, 1 insertion(+), 9 deletions(-)


-- 
With best wishes
Dmitry
