Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6A4D2304
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 22:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8C210E5DB;
	Tue,  8 Mar 2022 21:03:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8651510E603
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 21:03:42 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id o22so229554qta.8
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWhY8qlsdz7JCpSZpDlipoozq4SQyuAAucvDJGO5X2A=;
 b=I18vN8/IGEzuef44T7UgjcAGV/5fB8EmlgFJQNIRCsZvpnXLXns+WsL3tlcx5x3Sa7
 +EbPcoWiByB4/+7WqmKvv+JHeQDuLq1xTe83ek4BHXiWHrfM5pmZJyc06+SoudkVM7E9
 SCYmq+1SCmnIoSI1yIa4dYQ2Y8nFz+7z6zsu9kqb1ygxFXjg91duNvBVMunZ0YrW6Nl2
 Cby3t19bnzEOkLdkKDXVJLufP1M8N8qcr2Ppt6s5DHCb+QY6yjchRWl4FUAJC0xU5XqW
 tOSjDLYSMrSAhMDXF1tErKpGWljGB1tldoWc3aSuy4ZPwAjLgOE14hj5T9XM89bg6Li4
 B2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWhY8qlsdz7JCpSZpDlipoozq4SQyuAAucvDJGO5X2A=;
 b=omU174w0kpxjTJjTQkJXM2ri8mwCMznEE6srLcXmnUtDX/dIMUQ19vQaCWnyr4wCcO
 hustDi2b4zi4faOLl2DxIqwk31kZx+FbaZ6NmKK1pcU1HezXa/Aq2qmEa0JhYpt4acJ9
 17QAA2KFnW+cDmt5IUnPrkOSkQN5yQYvkyDXe5daFg8BtWipY8Ip7LW7za3freOuGiOr
 4EC/IRu9e19tII8veupLr+Mi2AWrZb3q+o3pEuYCmnVpxfcuwkTUB1aISAPzL6CSEZXR
 UUOOQVLFlxRqJOTsopjOfKS9TYAkKqZ0ghAdJZvatn2o1c2gmE0InNTUdKZ/uOjZlACI
 BhHA==
X-Gm-Message-State: AOAM531Cj7ne2LjSP7Km3lIPNbEw0zClu4wnIRKdZXHZhXLUaKvLsZzy
 3WiKQ19mI/+w++tMd1nV+BYuGOPwwy03woq0AkPfOA==
X-Google-Smtp-Source: ABdhPJxHaZrUYr2m2Hlos3OFVZ5iTKhrjft5Lscz7Y+azOpRkhGOU+LvOYkxFfMkz8mobriFIysyNSnVFHYzB2SB02I=
X-Received: by 2002:a05:622a:170d:b0:2e0:7148:ec14 with SMTP id
 h13-20020a05622a170d00b002e07148ec14mr3907614qtk.62.1646773421537; Tue, 08
 Mar 2022 13:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20220308184844.1121029-1-robdclark@gmail.com>
In-Reply-To: <20220308184844.1121029-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 9 Mar 2022 00:03:30 +0300
Message-ID: <CAA8EJpqzdXTMbFt4xT5t+nsr9Hgo4mUyfJRqx6obcVtxy-tPHQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Fix crash on devices without
 devfreq support (v2)
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
Cc: Rob Clark <robdclark@chromium.org>,
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 21:48, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Avoid going down devfreq paths on devices where devfreq is not
> initialized.
>
> v2: Change has_devfreq() logic [Dmitry]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 30 ++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>



-- 
With best wishes
Dmitry
