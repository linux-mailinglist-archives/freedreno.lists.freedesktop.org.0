Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB02A6E75
	for <lists+freedreno@lfdr.de>; Wed,  4 Nov 2020 21:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B3A6E220;
	Wed,  4 Nov 2020 20:03:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3E76E220
 for <freedreno@lists.freedesktop.org>; Wed,  4 Nov 2020 20:03:02 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 9so23480154oir.5
 for <freedreno@lists.freedesktop.org>; Wed, 04 Nov 2020 12:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oBqDX2AjknVBn06K8/u+vt1ooNK8RMqy/l2tyn5+RE8=;
 b=A1MaKudTGyKBlZNLeFMUnTp0zYA6EM6yTPVFn0q3a9YSDSOEQb5mWmb1LedQ+sVcqr
 TeiahZv5/1cNTpX/YvI/260QRyGagRGlqudOuXKNJnhTUIosnexk1UvhmHWKxlF6PprB
 cYSX7n7AVpqASbf/lGcq8VrQMFrnoQG4rSOZOwyA58qNIZfgBPnRACUQ5PSH+9GtVj6E
 6sXzzhkh+1yhSSkSsWeIuMJFSjJnYIFsJUayjVPos1sw1ZZIWbyYNwG95a78aQkuIfG6
 ztwhh5loigB55Q/KJJl2gl5IbPtrT8thpq9UOgF9T/k6uBIwFPfwJhxFHlPFeyBzpbfV
 iS/A==
X-Gm-Message-State: AOAM532gSTYNPVGlaW1zIxXbB0Mgb69VRdYzoqwAjzgNgB4YJaLqZfQ0
 ROMCu5qISooG6b0MmicnS7XamO/Icw==
X-Google-Smtp-Source: ABdhPJwScFjt5SJiTj7x04SzO5UJDiz4X8g4A1clj71IAewexTQOZdLGaJUnD77962i4rsrTIwSVtQ==
X-Received: by 2002:aca:eb06:: with SMTP id j6mr3334409oih.144.1604520181850; 
 Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h8sm660259otm.72.2020.11.04.12.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 12:03:01 -0800 (PST)
Received: (nullmailer pid 4037168 invoked by uid 1000);
 Wed, 04 Nov 2020 20:03:00 -0000
Date: Wed, 4 Nov 2020 14:03:00 -0600
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201104200300.GA4036650@bogus>
References: <1604054832-3114-1-git-send-email-akhilpo@codeaurora.org>
 <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604054832-3114-3-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5 3/3] dt-bindings: drm/msm/gpu: Add
 cooling device support
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
 dianders@chromium.org, linux-kernel@vger.kernel.org, mka@chromium.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 30 Oct 2020 16:17:12 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
