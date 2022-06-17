Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420954FE83
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788F710E187;
	Fri, 17 Jun 2022 20:48:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192D688FC8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:48:47 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-100eb6f7782so6930904fac.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
 b=Oax+hb9jz11E80qid8APuomKpd1AiYADh5Zfb5n+Y6a/her9EiKju+LU3dKDEjr8lY
 YhYXxlHkYUMfxRzIzmOJT0EvN55leGg8E8A/L0+zVd5ny2ZP8DEsXr1aI88AF5zDhvzM
 DLkNe7+ayYWePHOAQW6WVD8xdAjTCgjqXOdqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Y4XNPPOTHcGQua89ehLw74GJaEq7bj+hezmlX6AJcYE=;
 b=KdyTZtOEnksMcn933ddR8VdjXd0LqvIgwTG3gRYoXGt9VjZY3ZQz1TPgnVpsbOo1fz
 +2zAWHdC+zUW+eGWEPxEuPMUjnyDyKc5sXn532w/iEnnp/WBu6GcfIxWWv83rEWY4gzs
 xIALuLKNE6cDsPqrUJaD0RtoboHcPEnJyPIJEFp2xSI6B8XVl0tO/rynP6o9OAMlnHSA
 vd1DosOpweQLwCCnIIaAQtAmckG1lu4ICUrOFrqtO8kDdiRi5vUQgt64NDro/Mg7nPLC
 SEeFMZ6lMd3AtSNu3Nck9zBCxMb88v6NmOkiu7Va/y0uCK8uC5iCuyGIzWKiV72dUKns
 Z6zA==
X-Gm-Message-State: AJIora8A17L+/SG6zipIJ1QyeQHWi7x0ABMXfr1iZncUnu0FFSZ8f1m6
 yMxX2Nr5cAgcI4vYs0xgphU2tibSGWMeyk/RGmoq5A==
X-Google-Smtp-Source: AGRyM1sBdyafzJaFAWXzzdqzqbJCmm4BoflbCmCwm6csBW+c/DYUEooGn1aPbS1QG/DhTZ9CKV43uKNzGz9cffP+yjM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr6548394oap.63.1655498926376; Fri, 17 Jun
 2022 13:48:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:48:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:48:45 -0700
Message-ID: <CAE-0n51J5K_o=Mmt5aYiS6MMnHTfhPG28Pe6-9xZC0bn=zbK=A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/3] drm/msm/mdp4: convert to
 drm_crtc_handle_vblank()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:14:27)
> Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
> instead.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
