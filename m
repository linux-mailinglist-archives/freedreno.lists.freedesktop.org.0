Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EE1FD90C
	for <lists+freedreno@lfdr.de>; Thu, 18 Jun 2020 00:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964E96E202;
	Wed, 17 Jun 2020 22:40:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E9A6E202
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 22:40:27 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id i1so3906688ils.11
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 15:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zfs6fQ9dNu1WR3lr294IASeX3pxyyPciqezJugqbLdg=;
 b=NBbCpdI3jiPyGj4FRpGvVT0oHibYOskwVntqrdIVW5FO1zfjHDrHWLqFWMT6QOcnKE
 9gw8ciy4mhZ1F7YwZ3nFBlysGbMJDz88PCoZYh8u1WqHWZ5jUkUHaD/6ffRnrR/jLmGG
 8ufHKwUHN7NMqNtsC5oxHJWAXL5lFkHAUO760Tt9Q4lDUiiGOQcx2Q9OvPUGCmGXgQmh
 oqOkLl+PHGhP7GjEyD4Y/ZCPrD171IaAtdBusI8Wh5rqH3uusDuBJCeJ6JZ8GcPcFTSc
 W1FdtHXcUPGcV0GjKqaW0OTDxxUO+irOBNwQBLLv2dBOv42sDpr4kjA6ob7OtqSl6q+q
 MNPw==
X-Gm-Message-State: AOAM533xbOXyASI27kI+tQq7sX1AJuMDOIUHl2h9vKjaYqkmqwrixca4
 h1ot9JyndcYiCW8m2sUvSA==
X-Google-Smtp-Source: ABdhPJzRwz/0uaYi76fA5Zd1pUASZHPvWS/+PxMD1pnVAfG3nH0ehNSUR64R0ytuzMsQ9XxUG4dQDg==
X-Received: by 2002:a05:6e02:ef2:: with SMTP id
 j18mr1221721ilk.69.1592433627244; 
 Wed, 17 Jun 2020 15:40:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c85sm537559ilg.41.2020.06.17.15.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:40:26 -0700 (PDT)
Received: (nullmailer pid 2970050 invoked by uid 1000);
 Wed, 17 Jun 2020 22:40:25 -0000
Date: Wed, 17 Jun 2020 16:40:25 -0600
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200617224025.GA2969998@bogus>
References: <20200611222128.28826-1-jcrouse@codeaurora.org>
 <20200611222128.28826-4-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611222128.28826-4-jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v8 3/7] dt-bindings: arm-smmu: Add
 compatible string for Adreno GPU SMMU
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
Cc: freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 11 Jun 2020 16:21:24 -0600, Jordan Crouse wrote:
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
