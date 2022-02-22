Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C34C042A
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F7010E671;
	Tue, 22 Feb 2022 21:54:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8017A10E671
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:54:19 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so19556527oop.13
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/fswJzUEDkCYZUBest3dcpOg2Q5z120D3pTqYi+RKE=;
 b=T9pAZyLo2RYUndAy209rF696MnmmtCkSD/gA717CtAFmw1zjG16K7u/ED//siNQIOO
 qf9bbWfYkG5eFt6brJQ61T+3fRDv5TlfJ9VG9tzUKmC9UsbfXQ9/5AQ5SYeTRe2hJ1Ro
 7YA7sesxkBoke4RL/ggsP1lu1iJ6XMTcr1Q1VqD7aKNC7yzxi0bfqGnUt1bGugfpsmT+
 fXaF06vQvvNwUypCMfRIIdwWbapjWes6Fc70amSyqJO5uZ2UTGeILHp9aLX3I/mdHn91
 eIjCq6QhbV50Ac4LYKaa1m4cJNpL1A5bwlAz3vDliR8u9o6wgk6L9tS0BGjwk1z/kkQP
 HR9A==
X-Gm-Message-State: AOAM530GEMyobkl41ASL9WkpGpOJ9WSQzJDWOufnF+zjj5fnU2Et9asY
 rco16Vr6QwneflYwKz3LGQ==
X-Google-Smtp-Source: ABdhPJzn+fP7rFhHV2awMmAZS6Y/PbNN9AVIOEBNbdAYP4d8fs58Cc9AtHpwNE+aGYlGkIX1kjq/kQ==
X-Received: by 2002:a05:6820:827:b0:31c:923f:bced with SMTP id
 bg39-20020a056820082700b0031c923fbcedmr2713380oob.79.1645566858755; 
 Tue, 22 Feb 2022 13:54:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n18sm7888084otr.48.2022.02.22.13.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:54:18 -0800 (PST)
Received: (nullmailer pid 3655791 invoked by uid 1000);
 Tue, 22 Feb 2022 21:54:17 -0000
Date: Tue, 22 Feb 2022 15:54:17 -0600
From: Rob Herring <robh@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>
Message-ID: <YhVbidYOF2n4aqjl@robh.at.kernel.org>
References: <1644853060-12222-1-git-send-email-loic.poulain@linaro.org>
 <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644853060-12222-3-git-send-email-loic.poulain@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/3] dt-bindings: msm/dsi: Add qcm2290
 dsi controller binding
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 16:37:40 +0100, Loic Poulain wrote:
> Add DSI block specific qcm2290 compatible string as valid
> Qualcomm DSI controller.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
> 
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
