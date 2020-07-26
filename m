Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3118B22E177
	for <lists+freedreno@lfdr.de>; Sun, 26 Jul 2020 18:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29A889D9B;
	Sun, 26 Jul 2020 16:54:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237789D9B
 for <freedreno@lists.freedesktop.org>; Sun, 26 Jul 2020 16:54:40 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id y10so14738665eje.1
 for <freedreno@lists.freedesktop.org>; Sun, 26 Jul 2020 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
 b=WZYXiUPxENKn4QSxY7fPf+iBaAhsNwecbIqIua+YO2effyaCG04XLdhlYe/ugtAfun
 1fXbuueu1sL3HDK5Dtsz0YubABpEtjbQo7eptsxI/lBXgWB/3WVVVEEmE5w+FLXH6uKi
 ZIeZey8Cvr8anwVeJAwUu0rt41msmaOcLhKWamXZ4XPPQloplOSyM69HBfahGiFQeaKe
 VdrYrSXa5wP7b1gmFMJiWqd2K8TOxBosAvi2Z9c8hlyuujPC5uhKq+dgDVj4VMpUybxU
 kiYkfmIFSDy/R08StwIylDGo6dkk0/l7B5Clr00ZfG0Jw2OpT/++z7w9JMSJTwfmA6aD
 AyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
 b=ioX2yHFKed3jDNAcTifKrlDaS6vHdPofD2zLHMzFtp12d3c7nnrx86o9XjTvJUvE9+
 L9QzhSQHW5C/Ktl+lIQpvNmISj4lwBQ/I/60sOd2SjAuJVO+6Duci5vUVY/NdQmLI69S
 Pe/oYXaePnp5SWDY3VDqtGSje0vpXTS1oRleBFcfxU1AFXl2tGJkoQm1/s27mKoJRV31
 jVixH6rgz8GzfIj45MltxUDsA3mhm570xebGjqiANVKUjXj1b8zib1YH2VOhB36wq+eQ
 7EytHKRW7NKnzPLxsQnBLfU4BjsuwJb+GolH4eReM6w5zwg+3mFpXdrzoMYtvVBA7xbO
 IH5Q==
X-Gm-Message-State: AOAM531yXx7XgSvfHnV6MJ94l/gTjN29WbGTth9Cxyg598jQqAt3VSVn
 2l+9TkmSdUxhqj+VYIDLYdX7blWvIbaXV49wp8A=
X-Google-Smtp-Source: ABdhPJwDnlAPaImQnrQAApbQ+w+cGsIt/2VZqafSu7Ti4+lytmzJqD4dBVNo+ZeSue4XBagNFOp/lX3pdQrzVmj/eOM=
X-Received: by 2002:a17:906:f199:: with SMTP id
 gs25mr1970599ejb.161.1595782478958; 
 Sun, 26 Jul 2020 09:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
 <20200720154047.3611092-8-jcrouse@codeaurora.org>
In-Reply-To: <20200720154047.3611092-8-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 26 Jul 2020 09:55:18 -0700
Message-ID: <CAF6AEGu50KtjFHJO3Txrbjnn1xoG5WDyuU_e__RsGPXe-5Z46g@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v10 07/13] dt-bindings: arm-smmu: Add
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 8:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These

minor detail: this is true for a3xx and later but not a2xx ;-)

> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423..e52a1b146c97 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,10 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>        - items:
>            - const: arm,mmu-500
>            - const: arm,smmu-v2
> --
> 2.25.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
