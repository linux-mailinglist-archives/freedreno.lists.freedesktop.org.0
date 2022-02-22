Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DEC4C0416
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 22:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629B610E7A2;
	Tue, 22 Feb 2022 21:49:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F9810E7A2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 21:49:38 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19589772oos.9
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 13:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ebwfl2eVC7RMG7TrRM62AKX6vi1kQ80HjW8V9xOBqJU=;
 b=FoKWsJWobVw350e0MtJI29+FOzmuyALHkcqeebGY2fLwfPgfCzt0Jh7pzURVfGn4vG
 7JbIESR8hW6hSBylnoXkLZnRYgQ6mi5yhSbWk3W0G9ikUb1BbGlRRQo4CTiQ03nSsaC0
 vn0jVplQ32TC0QuF3CC1oEf1D4mZ1+ZtVpgHURb2U0zVvxd4PcI+yHxWLxL1x2mYWsQg
 9nzYdEddbN1KMJm8AgJZI+W4s7zG7uf9GJWlVnriB3SJ9wqpIc0SHuxEzNt4K/xm5rWl
 8rmSCSZyKU7JH51qzeh0Ev5m0EeavWSmx+F9hzanE3pT69P5+vrmDTcnjCvEMX5qymfM
 gi/g==
X-Gm-Message-State: AOAM531h453zdJwhzACWnfe1LRGS8kQy6PQdOUNbIvyzEYer3p2lu3UN
 El36p4DZNK2ukDEvNYfVFDw2Do4GmQ==
X-Google-Smtp-Source: ABdhPJxB8cT0SXmsf75AE57wSFwspy0iLoY6gC+c1PVenxqa73yKtWDGjBo+zNh2nmJog+nWTPzFhg==
X-Received: by 2002:a05:6870:961a:b0:d2:858c:ea4 with SMTP id
 d26-20020a056870961a00b000d2858c0ea4mr2609588oaq.186.1645566577595; 
 Tue, 22 Feb 2022 13:49:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id er36sm3094947oab.9.2022.02.22.13.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:49:36 -0800 (PST)
Received: (nullmailer pid 3648870 invoked by uid 1000);
 Tue, 22 Feb 2022 21:49:36 -0000
Date: Tue, 22 Feb 2022 15:49:36 -0600
From: Rob Herring <robh@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>
Message-ID: <YhVacAAFoPxC8S4q@robh.at.kernel.org>
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 2/2] dt-bindings: msm: disp: add yaml
 schemas for QCM2290 DPU bindings
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

On Mon, 14 Feb 2022 16:29:07 +0100, Loic Poulain wrote:
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
>  v3: no change (resent with reviewed-by + freedreno list)
> 
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
