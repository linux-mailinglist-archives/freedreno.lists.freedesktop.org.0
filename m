Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC534D813
	for <lists+freedreno@lfdr.de>; Mon, 29 Mar 2021 21:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC656E4D4;
	Mon, 29 Mar 2021 19:27:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD456E4D4
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 19:27:40 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id t18so6499822pjs.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
 b=VG9vKllJLEVGDoxMzgj9Ca/pHGciCQYIlbDtMvtq/UxPIoZJ7ECu6spWARntl5zsf/
 A8CFT16NL16g6h6qu6ZLx46tgg/KuMMZjqPKuBS6XcMnfxNXsZM1MfytkYVabIG6ZKDm
 PR3r01+kpuLeiEDca5bMktPktb/vRqeV0WdlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=KLlTAo4el/DFnNk+LNHJMO2kyu5BygdFuXHahiqxgP8=;
 b=uSrUnfV9dRs4RIQJTA8uXTuSqU9gV6H0phgXXLSkK9k8mJeILmLdPzj4MCCscfnOFQ
 9bU9qP32VFzV2WB0A0QI4zZH0AjOfLbkTFKX8AolUNY89z99WJsCXeXqsE1smQrX2VsV
 kmP+sFHrfysoPGCDCf3j94pLqMRhmkFQHcD6PDCJMaNuQwTiLbc7I4raEV3einjQxYoF
 hEjLc++cf4xO6iPl9PGdwaUmBdWKFt95/jq52as+OeDBTMh5LswW7CmfURO/dTUXzqHd
 NC3kutrxtOWPHoUhQqWxwe/L+kJC6QEpsGKe6LNnpj52PyQzifhE3x+sMU7iYReZj51C
 +Mxg==
X-Gm-Message-State: AOAM533Jlil9oNWw3s1LfbSCMVJCbH7c9YOITbQYfRH9DTH3Rz0J4/2l
 jgKi1goUeS+9GSKR0h7E21K6nw==
X-Google-Smtp-Source: ABdhPJw1DhTcHAq11BdM7UZT1sQLUgR3VEzIOVIqTPbRMpjGdU3juswhlMA73YA6oU55nTpMohAISA==
X-Received: by 2002:a17:90b:4b08:: with SMTP id
 lx8mr616674pjb.135.1617046060512; 
 Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id j3sm305291pjf.36.2021.03.29.12.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 12:27:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
 <20210329120051.3401567-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 12:27:38 -0700
Message-ID: <161704605849.3012082.9945764472677336582@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v4 3/4] drm/msm: add compatibles for
 sm8150/sm8250 display
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-29 05:00:50)
> From: Jonathan Marek <jonathan@marek.ca>
> 
> The driver already has support for sm8150/sm8250, but the compatibles were
> never added.
> 
> Also inverse the non-mdp4 condition in add_display_components() to avoid
> having to check every new compatible in the condition.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
