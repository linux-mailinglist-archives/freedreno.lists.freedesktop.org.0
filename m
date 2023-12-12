Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0280E4C5
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 08:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA5310E571;
	Tue, 12 Dec 2023 07:22:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BE910E576
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 07:22:30 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d8ddcc433fso38424447b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 23:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702365749; x=1702970549; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
 b=log+fSlQkQJblHckYWpJIwqAg6yPDRUiXkTF9B+MiQxwjotNW9Clv7JjJ5FA8Xf0yf
 EWSmxQeSjtWTzdvJcMTCg9YNOxS2btSBQltZbqrbZd9krmYBR3gjA03TJdN/GyyC6ALg
 QG0tgMTyf4tklKk4Vvd79W5gHCRWOz4sb5sMHl8sIPDYj/1q/fbevTP5YY3wAE7+cC6F
 u/NYP7UtQJAxf87oPACoKmc8uINaGcbEV9wTQXJH82EsOrUSelBOOyV6UgO43zRZEpd/
 JEJbBPzY/vyCNtUCY6nbhqfuM8nMOdoe0yPg9XR6UHGSoQfftHkPLpn7bAS30Fn4Axp9
 0HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702365749; x=1702970549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
 b=jz+mOFEPwMyLIu6hV3NxMTowa0wiYQ33j6ua1ecbl+hABblL4iWcwYNqwtf6DJHYHH
 12ndow4kCjiq5Ykjx6UCZy+Rsvw15KxmsTizBRdycWUOTmb5K7YKDEDsYVR1hoBYboml
 8zxJ51N84B5aCSyXRJQbs1KJ9YVL6aSCMp5Jgjj7+AveWXHifGmas9GQhUQXZzDQANd/
 XOGfsZFSPzlQPvW0YvQwMul7yE8o29y+hBTN9oi/ZW/16sjT0GVIZi2kk3TiuOnFocLk
 hy7Bk6UJaJrHrlJ0OOT8UbsQMpcdYmM6NO++EWWGrJC93kXKibC3S1gXAecPKSsKF1x4
 cvAw==
X-Gm-Message-State: AOJu0YyNHnHRWLKeIDlLM6kHbca9yhL5icp5i5DZaar9cU39hLPpLeJF
 K8fvdLKkzad4KAfvFeZrSYJlNyzssa/zsJwCiV+g4g==
X-Google-Smtp-Source: AGHT+IFPR8fd+a0ocBEqptE2Dwxw2OhgvjQgzcLmo5cYSUTDyVSX6swyFuxqgUbNPyfiI+F4JCcixtPa397/UgVjePs=
X-Received: by 2002:a25:2653:0:b0:db9:8bcd:a071 with SMTP id
 m80-20020a252653000000b00db98bcda071mr2411598ybm.28.1702365749111; Mon, 11
 Dec 2023 23:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:22:18 +0200
Message-ID: <CAA8EJpp72_Qy5Lh+bq4Zi8_DRyhCf48gdGRz2fiZvb4y7qb4SQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] drm/msm/dpu: introduce separate wb2_format
 arrays for rgb and yuv
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
> that it has only RGB formats and can be used on any chipset having a WB
> block.
>
> Introduce a new wb2_formats_rgb_yuv array to the catalog to
> indicate support for YUV formats to writeback in addition to RGB.
>
> Chipsets which have support for CDM block will use the newly added
> wb2_formats_rgb_yuv array.
>
> changes in v3:
>         - change type of wb2_formats_rgb/wb2_formats_rgb_yuv to u32
>           to fix checkpatch warnings
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
>  6 files changed, 46 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
