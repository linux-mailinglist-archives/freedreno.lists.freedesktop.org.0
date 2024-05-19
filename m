Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66F8C9425
	for <lists+freedreno@lfdr.de>; Sun, 19 May 2024 11:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2210E0A8;
	Sun, 19 May 2024 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HQGo2g/q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C8110E0B6
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 09:01:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51f60817e34so3905181e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716109291; x=1716714091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
 b=HQGo2g/qR5S2odONZcHQ7Nn6Wu0MTiO3WNrnWpEzE5Yrl1dEF2qwjXcOjM9k/BJQuN
 hEYLaX7+OW5DAP4uCTqTsbSAYq95nQWpxHUM3G5GgMH87KqlNz0nrHk0Ft46taLGRT/q
 qo+TFffYPOjc+bZk8PmESMS5nj+S2H+RYmsZjlyhL/TLzsk40IW8DA6M5TATEYLrhibG
 qO1dSzcuOZYvwkGDdmFDav+fLY5KPpTCtDARTsB4EwjDpfU3pZM4NutbKVGjcwnfeBZk
 mhAdGMQ2eotMepMaO9gvJL2Ny3yGwL/9Hg/aqnFVcmX/+KDeQkNpk4ridFFWgfaAELyd
 1T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716109291; x=1716714091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
 b=vk/dCXjYaotBO+KNsFQL3c77/EeJJSN+2TZ2pTAwWZfylPnUj54PWRQyFBmHDZwUxc
 ztMkCjqd5Do047gD5xEjCESOb3CVF105IHC6KR1whi2sHBy6BmwnCSmPKOtwcXjA977z
 SNsvE/DEJOfeaAUe+4ZdHy1aEyj27SUR01yN8Y2ooqMvC8Nwp4EUcsfdLtteK2Fx3H25
 bqZuIoxE04WDB94t0Vs1mgGZV2WYYwLYoUymJgNqsPjpY+FO2NfK9pv5Yjxos4SuXGBO
 R9qhVkW3NF8INJxddal7LBKK4K5RGGY75SHhARdqcs9SN1pMZFPU/lDSVJVj/Z9QAUl3
 FE3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjPXEqH9Bhfl86+K8Hdc4eyS0bZv1csBb9Ea790/q3mqzJ/Xky2BW3bKetsEG72vKSgTCJRh9JAN4tXzCVMYPmoEWYyTD2Q9LaG7hEIMLl
X-Gm-Message-State: AOJu0Ywy9CB1ZZ+dIqWVbme2GVnx1LecHTani06RniV7qB8rqq6PBTgW
 rcmvkvS8+GVUgT6q2cpHsH+sf4LeqMB4aknXdJZUmdVywphkR/JblggvSTsWJhc=
X-Google-Smtp-Source: AGHT+IHo2lG2QfN3wSHOdCTPeob4sZG4UUob2G1FAI+cUqka9doJg1KkF/LYr2/BlXVeJ+LSz1LbtQ==
X-Received: by 2002:a05:6512:131d:b0:523:6354:881e with SMTP id
 2adb3069b0e04-523635488aemr12970576e87.39.1716109291007; 
 Sun, 19 May 2024 02:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad584sm3859393e87.21.2024.05.19.02.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:01:30 -0700 (PDT)
Date: Sun, 19 May 2024 12:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Nikita Travkin <nikita@trvn.ru>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Check for zap node availability
Message-ID: <zqncrzat2adqwdbvtjzrropwvfmhplmhv72mzv2nbhbgg54byk@wbpgofmqpjtn>
References: <20240517195021.8873-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517195021.8873-1-robdclark@gmail.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 17, 2024 at 12:50:19PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This should allow disabling the zap node via an overlay, for slbounce.
> 
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
