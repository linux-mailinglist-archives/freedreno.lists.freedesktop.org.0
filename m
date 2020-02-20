Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63816697E
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2020 22:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2F56E231;
	Thu, 20 Feb 2020 21:02:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079FA6E911
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 21:02:44 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 70so2527536pgf.8
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 13:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
 b=JsoqIRD4xomQetfHM7XtcK7FHq/ipSAEkJsVnBvyST4DrAaAZF6BueSVgo/A0us1yb
 ELSgSfno5PgHnoJm/NzqbsG8qQ02kmK3xDxajwkASRuGLEPI5+BMdVoxVksurm9wJ1Hp
 6IrSh0MG+2h1RvRA1zHGLa4KQ8N8MtjmIgGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yCWhyMONDF7/2d7s+slz/xE4GsVXYJ+VIwzdQklkW/U=;
 b=kKVI/I/dQavTHVgYyNtLnSTpqb4layqNKxOWevkSvwuTcsEy71o+p6UAjrPoqXZlkm
 csYb8BVrBSzxxasoVrzRVidMRSNCHZEAFlcAwsLSSMMwLyHUfD97p2L8anGY7PdvDy65
 /en+CwwmNgTI8cTJXVTkRtFOR4raIHocZRP41p2uzZlJ4lj8S8Z4wMMnMsqu0Qlf+zNS
 UIdISUGc3/G3l0kstj39240zm8rc+occr8dPj6cWcqnF5LMQ4b/ynmLuK/qLrbKsqqcC
 H6wF2PUcCbH5P/MKQUuovAGDhm9JzRAi2LBKDIfZ21mkONph1syagmUMJw0qydt0WYkH
 AVtQ==
X-Gm-Message-State: APjAAAVnqH3e19HAcs2K8RNQVHcxAj8XhqHizXo8iQ7oVug8etR4MRSl
 WBJqZ6C43bdfVVmMoKTWPTs9Qw==
X-Google-Smtp-Source: APXvYqybBEIA4/pqHt8cShquf8H+vaT94NLFSfun4J2uEKy/wjt157bBu3t/D8co6V54Gr/xmMNoZQ==
X-Received: by 2002:a63:565e:: with SMTP id g30mr3053334pgm.206.1582232563637; 
 Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id o73sm341592pje.7.2020.02.20.13.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 13:02:43 -0800 (PST)
Date: Thu, 20 Feb 2020 13:02:42 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200220210242.GC24720@google.com>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH] dt-bindings: arm-smmu: update the list of
 clocks
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, jcrouse@codeaurora.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..235c0df 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2

The addition of the compatible string isn't (directly) related with $subject,
this should be done in a separate patch.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
