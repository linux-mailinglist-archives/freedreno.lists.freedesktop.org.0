Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66838CF4C
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 22:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25C6F908;
	Fri, 21 May 2021 20:47:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839486F908
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 20:47:06 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id c3so20847549oic.8
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TQcLiSVnKRJzenCwna7ngqxRsaLGZr+v2iY6EXgsM34=;
 b=RxV7PAPfAOW4VRWCsmjDUqu+14k1FN0EOjRQCi1xSa9voQD/0fwGKwju/JKybmgHH4
 tSPHk6AZ2iA+BGGxKCoaluylMdKll9vykrQc1o1Y5pzieScoktGva9Pk7Hvp1DnP93d9
 namjq3wKjEPWQ9MxTuJU0KgSNxtHrvHCAU02E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TQcLiSVnKRJzenCwna7ngqxRsaLGZr+v2iY6EXgsM34=;
 b=VaLhOT+VN+mZ+x6o4GTsDnINbZYVPzEbzKk6UV6mwYx2SQ2G1SpA9xDvoTK1Au2K4m
 5KYfmls9w7lGhzly6RsiRZp1WiA8HtgtbrSn3EkTlD/Wkaaf521WfXznT9npkgyP5WZw
 v6OYzONVNoIeuYg3c6BuMICFYQVqR5PzwXmGh6PaD8JUUZy4AlIWvIvYAvghyhFaM8Bb
 Zd70XAqn3qz3J04kY968gFW2VRnBIlD0VwAZnPm6dVJm522zOmPvGCyDAwopt6zgxW7J
 qccPU/gVD734Dliled5ufilJVfqCoUMR4kghIi/x2RMMTSDA5cU5HlOlM5PgPKz2tS/R
 TKLQ==
X-Gm-Message-State: AOAM533d704orCxgp7jDdXzKNhZCTJ6ODujfo4kH9ksCZljtq8wRXda7
 BCW3D1Gw4AREXRnFiMRqSq0o4tpZFLA3JOsLrU2Z78Yootc=
X-Google-Smtp-Source: ABdhPJwAxNdSvrqf4vckEtp82I8zCxcDswz30BhHrCBYKGAA1KsXJKhSRvwPpYfWclMZWwJJXlpQ71zH6w0LGYnM3ug=
X-Received: by 2002:aca:654d:: with SMTP id j13mr3613806oiw.125.1621630025860; 
 Fri, 21 May 2021 13:47:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:05 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:47:05 -0700
Message-ID: <CAE-0n51JasjB5Hai6uM74kCCPNx4Xip1fW5v2aEqdz=edytf+w@mail.gmail.com>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v17 1/4] dt-bindings: msm: disp: add yaml
 schemas for DPU bindings
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
Cc: robh@kernel.org, vinod.koul@linaro.org, dianders@chromium.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, khsieh@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, tanmay@codeaurora.org,
 kalyan_t@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:21)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
>
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
>
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
>
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
>
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
>
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
>
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series
>
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
>
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
>
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
>
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
>
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
>
> Changes in v14:
>     - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
>     - Add required list for display-controller node (Stephen Boyd)
>
> Changes in v16:
>     - Add reference for port (Rob Herring)
>     - Make additionalProperties as false (Rob Herring)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
