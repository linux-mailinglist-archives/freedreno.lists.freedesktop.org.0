Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869017A2BFE
	for <lists+freedreno@lfdr.de>; Sat, 16 Sep 2023 02:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347C410E6B9;
	Sat, 16 Sep 2023 00:31:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B40B10E6B9
 for <freedreno@lists.freedesktop.org>; Sat, 16 Sep 2023 00:31:09 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3a9b41ffe12so1704267b6e.3
 for <freedreno@lists.freedesktop.org>; Fri, 15 Sep 2023 17:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694824268; x=1695429068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wp9G9s9DRH28HBBlorzfOU/YKDu6BHZ8nl53NHfF+6U=;
 b=D8NBPS7O+7Vopv7eb6QgByIJBasUCPMVfE7ORyazt5+GSOElreQCqLkGRrLaPZnqql
 JOT+ny1bAPdVZJNmjYfpU4l6kjvrFM874ZRYV0GEqR0szKpWQkWX8Kid0IKwYjVm1vBQ
 oUe30T4ZRCJKgiKbU0M0Snp+on5oCQJZt4/LX1S1r8J9qq4D7KPbcUgs770AVsSyPWaI
 ipmHBo7sOTtpe+9vt2kAy+cZ3a13SzrWSNGxDCePOHQXPGsieHeK8zsnihAijgjaALE4
 f8r/qWlzeYRQnsq9HADWi7vBhYCr25vAiIBuTGBvSjM0sGMyMm59bSMqOcr2NBtT+S9y
 Mc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694824268; x=1695429068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wp9G9s9DRH28HBBlorzfOU/YKDu6BHZ8nl53NHfF+6U=;
 b=TZQysTSrhMr8TxML66beUpNccLqp1XKVVd02Saw6tPhlfdoWUuSf2sFsEbfVkZMIAu
 tGEae50G/V2rYT8gpaDtyGCdIVUuLo2CjI+lVJsDmFCfa4HFZWZA7ES2kuq4lT1Ee7B5
 x9rj4MRDMEjdusqXkq3fURyLrGHY+Wd24TYDcIWU9RVWTaBJcJBh6AtYrTGjj2wMEvNG
 vqqpjou5aC7LqnrFIsJBZDZpQdhZ+S3kWE+mvmDLHndGinKoJppWLQEfbfSxs8/uTK9d
 YHr+ELzXN/ZNx9dis+0ZlkQ6lqpmyxibMRMNRi2E91+eeeAbYFJ9D5xzIiZvKY+0WXus
 x9tg==
X-Gm-Message-State: AOJu0Yx221EzHFFQQdPdT4qaWJPDcgrx8UD2Ozopp9TLO15XOCj9+iQe
 wwVDZbW0u/idnLWw/VhEohhgKwguBY9Z1ZvbYf9Y9Q==
X-Google-Smtp-Source: AGHT+IGM/5enZcjBhS6KYMkOeT141L6ZhN7mMaxpgFhmwQ/mJpnnizdzjkJxQtWVJhtldV6e0+vYCRheZ7GEycJUPHo=
X-Received: by 2002:a05:6808:309b:b0:3ab:8295:f2f1 with SMTP id
 bl27-20020a056808309b00b003ab8295f2f1mr4125798oib.45.1694824268304; Fri, 15
 Sep 2023 17:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204426.19011-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230915204426.19011-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Sep 2023 03:30:57 +0300
Message-ID: <CAA8EJpqfvmUiOvwE0PE_pWMt7MHTdNeSo1nCA5xG5ykp4Ln6NQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: skip the wait for video
 mode done if not applicable
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
Cc: Hai Li <hali@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 15 Sept 2023 at 23:45, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dsi_wait4video_done() API waits for the DSI video mode engine to
> become idle so that we can transmit the DCS commands in the
> beginning of BLLP. However, with the current sequence, the MDP
> timing engine is turned on after the panel's pre_enable() callback
> which can send out the DCS commands needed to power up the panel.
>
> During those cases, this API will always timeout and print out the
> error spam leading to long bootup times and log flooding.
>
> Fix this by checking if the DSI video engine was actually busy before
> waiting for it to become idle otherwise this is a redundant wait.
>
> changes in v2:
>         - move the reg read below the video mode check
>         - minor fixes in commit text
>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/34
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>


-- 
With best wishes
Dmitry
