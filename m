Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A692A0696
	for <lists+freedreno@lfdr.de>; Fri, 30 Oct 2020 14:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67A76E9BA;
	Fri, 30 Oct 2020 13:38:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FCF6E9BA
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 13:38:10 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j21so5513649ota.13
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+NTaR+FmsROaR0mc3AxOVyIyS9PM41eAe1X9dDcISGo=;
 b=qcRrEMo9xjoPv2XfEuTfmsXV3y9rv+oA9ZjZg5cR5cfQSGq+5ukZ6IJJVM9S70Hkam
 tnhrZeDPnAYjyGwRTYU/cV6GuRWa3h5xIEzN5wJFRyYzIz9lGyh+GUUgHEaAP8WffAVB
 DuDKj3xhKkUpZv66VyLcBjxnVyF5JcMd41zmFENjlnAFJvxafKB2fprzLzIX0ayj7Y+9
 EtJLMAybpraKH/Xd0dQW2uVVSD2q+vFd3LV/MxnlLbhob5G/cEC2rebQCKIf2kroCEQy
 3Rimjl/utF5ezHAoX9SRQqbl0u05S9gpHNoFn24Gk141T13YmIuG+14DwWWpO6WOIgI+
 RcMg==
X-Gm-Message-State: AOAM53222JHYGQYTs6HkOIo1nL1LUYg7Q2X1M7/4YCbzy13oDf8o+Qd7
 nwQQnYbLOsShhAF971FSjw==
X-Google-Smtp-Source: ABdhPJw2DwG/OKaEJ21EJ8MvBOaMf7vQ+RMEY20B0hdl2Y4TXBFZRVC5SVhlmh9eBGawREAWfV9uYg==
X-Received: by 2002:a05:6830:154d:: with SMTP id
 l13mr1814291otp.61.1604065090197; 
 Fri, 30 Oct 2020 06:38:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v21sm1315274ots.29.2020.10.30.06.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 06:38:08 -0700 (PDT)
Received: (nullmailer pid 3727265 invoked by uid 1000);
 Fri, 30 Oct 2020 13:38:08 -0000
Date: Fri, 30 Oct 2020 08:38:08 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <20201030133808.GA3727230@bogus>
References: <1603958841-20233-1-git-send-email-akhilpo@codeaurora.org>
 <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603958841-20233-3-git-send-email-akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v4 3/3] dt-bindings: drm/msm/gpu: Add
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
 linux-kernel@vger.kernel.org, dianders@chromium.org, jcrouse@codeaurora.org,
 mka@chromium.org, robdclark@gmail.com, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 13:37:21 +0530, Akhil P Oommen wrote:
> Add cooling device support to gpu. A cooling device is bound to a
> thermal zone to allow thermal mitigation.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
