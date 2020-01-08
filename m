Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECF134E4D
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2020 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BBC6E342;
	Wed,  8 Jan 2020 21:01:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7291B896F7
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jan 2020 21:01:31 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h9so4950137otj.11
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2020 13:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cfgEMc+35hwGrpRDO6jOoEHppPRh3rhAd34tDj1m5RU=;
 b=ItPZFjfE7dWIT0P1RNwhoXed+w8fN5GlsT+gVMv9yP4zdWzF0yuIBXV/2dsu/DcHhY
 UFf8oTKFdste6GtsW3xOxQHGZPLVHR+I0JvESSL52vawEY2x/G3GFobHwyzYuynDF0rz
 m/XnosSmYO3Xt0UL0pu1vH5M9MRW70+iyOuhAD80baQ7k9VO9W3Ns66c8JIy3l4KUn0I
 /MVYMSVu1Kw7kK0vh7mmR1s7883W0Yumlj5rVRjqoaCGtWNv7tRqNI7IPuQ2aXL89Wif
 Gvmgax/F9n5U0HnRVzTX1XKnFN6wa9aXh7FzD355Rx8dAqPHCOg0GdryhsbpNd6QxEoC
 1KnA==
X-Gm-Message-State: APjAAAV3E9dvmGIOKZZVKzLgjFt3w5ly5DGi0vq5X1A6X9cYl1TSVvZn
 BzKw78UuFfdcFNRCMQnEOn9Y6qw=
X-Google-Smtp-Source: APXvYqz1y4Ujj0aafpjbQDOhH7SSgjPZS08lbrZl3R/g61/vBD9g0RGKvtzf0Ccp1ctv8XrjXtBqLw==
X-Received: by 2002:a9d:7ccc:: with SMTP id r12mr5976623otn.22.1578517290056; 
 Wed, 08 Jan 2020 13:01:30 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i2sm1500478oth.39.2020.01.08.13.01.28
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 13:01:28 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220333
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 15:01:27 -0600
Date: Wed, 8 Jan 2020 15:01:27 -0600
From: Rob Herring <robh@kernel.org>
To: Harigovindan P <harigovi@codeaurora.org>
Message-ID: <20200108210127.GA17138@bogus>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display: add sc7180
 panel variant
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jan 07, 2020 at 04:59:56PM +0530, Harigovindan P wrote:
> Add a compatible string to support sc7180 panel version.
> 
> Changes in v1:
> 	-Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	-Removed unwanted properties from description.
> 	-Creating source files without execute permissions(Rob Herring).
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt

As I send in v1, please make this a DT schema. See 
Documentation/devicetree/writing-schema.rst.

Rob
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
