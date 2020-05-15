Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7A1D599F
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 21:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25DA6ED19;
	Fri, 15 May 2020 19:05:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B56ECEA
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 19:05:54 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id s5so1185288uad.4
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
 b=bMZEoYevT52u61nJD5we/u1JaG8jzU7khHbEmIItRoRo9c67denAC2dZI5n/GtGcte
 O6CuOaJk4AYaDQX4yq+aRjJIGv63nxepgB4RHH9gODQ+rlXq7MTS7sE4DkPKkJ4+uXL+
 cADO8rOPfT+7ANv5baePtF9UpQd+3uCS40EDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILTNxRMhVaU1ppwKtb504YY35g+lEq0QuWy+iVUE2z8=;
 b=FJk2fea5e8nWNaloGNGubq/oGe/QN6DiXFEMCca/1DK53DsY8Q9YeEw6bsBb90Z73Y
 1rIRX1cAM8buzzBq5r2wuNp7/aXEuub4ZSIYB/aTXdGxfkW9MDZzvng4jVreeRuLP3XZ
 6KF3BI5k+geFv6AwLsG/R1kruVgDM/BVClsh/ioH4rBDHQffA83im3aUjUTrLEakAvas
 GpTjHNBrSHvU+L7h1w6UpVyg7wzl5KFF3K5j34J+gu8GFL8R1sR4+75I1wZC+vWqzUOC
 Vd9HcKAR9YfwghTfGRe5kqjYOS52o6Xd93xwwhwip6J9cAmpGYHdk+uJmnM9nW2sJfsG
 laRQ==
X-Gm-Message-State: AOAM532S+/X4fkLxwlD+jIeSlgWl5WFVVKE3LZv18EBcw1+eaK28gZZl
 nyDBaNvo8s/fLyJqx9TArpm0R5DDjlI=
X-Google-Smtp-Source: ABdhPJxRd/VakQCFsJHb4GYl8vBN39SiKlZrbPIgCoIFkPE3o1t5W978KAJnWLhtxCE9ELoQmWFoeQ==
X-Received: by 2002:ab0:187:: with SMTP id 7mr2651949ual.143.1589569552753;
 Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id o21sm699813uat.8.2020.05.15.12.05.51
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 12:05:52 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id y13so1885866vsk.8
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 12:05:51 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3909984vsq.109.1589569551204; 
 Fri, 15 May 2020 12:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 May 2020 12:05:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
Message-ID: <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [Freedreno] [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180
 compatible string
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch simply adds a new compatible string for SC7180 platform.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..986098b 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2

Is anything blocking this patch from landing now?

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
