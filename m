Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D880F1C17D7
	for <lists+freedreno@lfdr.de>; Fri,  1 May 2020 16:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6AB6ECBD;
	Fri,  1 May 2020 14:34:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D136ECBC
 for <freedreno@lists.freedesktop.org>; Fri,  1 May 2020 14:34:46 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id l25so6395009vso.6
 for <freedreno@lists.freedesktop.org>; Fri, 01 May 2020 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
 b=bSkRbiyeyKlAUXC/Tij0LYdPA/GCDrTqy+eOsvg+0HMnmGzomgcFgIZwMrkFKKVTFx
 rY8tpU0oqwWB6Dgr1WBXsWo+XG8OHxSQyZFNutZh6UJLWPxJ5JTiiUQc32rVT9J+WYwK
 FlXoxI2nbxZJsuVKCqKMo1d+Br/kZKZFVpkOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OafIZu0wl5yq5qjn+apPMv+CXZqAeKvj/lS9W7KUmfg=;
 b=Tc0EYOc6wn/I0QGhHHhLtglgDlF/fwaV/DNQKwOYFC6cMZXV2qk4zPLZmbOquvLVq0
 t8281/WhT0rYTl/pVmYOV2Ao6oOplsx5mkCrns7rp324VUGAGiND3ro6p9T+Lnzcd+iu
 6EEQFf0oyhVaYLRMsnVQl0bIjJejcl8CU6LYImkZlDneLr32t8YOt9LXrTkuxhCndyiL
 /oZJMTc8TmFy6yQGyHN7EQufVxEg10RSgbWqdWD3aaz3ouGwSHEeCM8aKfwtxUZBu3qu
 MbUh7aYWR4X/VoYzS4/a8RuA0yrDTbd39ih7kwFDG7Yyu6fS0BHjzodrxTF89oaRJ+mY
 n73Q==
X-Gm-Message-State: AGi0PuavRhI6f8WiVGhQDdrrOVT7g8qc5Qqkwvq0is9WJtjB1fABEKjn
 3EivGKdhP+W25txl7QYe6AXp7z1aLpY=
X-Google-Smtp-Source: APiQypIVS9PAm2dHhv7L4s2iSPaFJ7CA0wLziNhOtk0q5UdgLmgBupex4c4n2QbEE5l0comNwPh3ZQ==
X-Received: by 2002:a67:e28a:: with SMTP id g10mr3327166vsf.51.1588343685637; 
 Fri, 01 May 2020 07:34:45 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id f14sm638718uab.17.2020.05.01.07.34.44
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 07:34:44 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id m9so3742877uaq.12
 for <freedreno@lists.freedesktop.org>; Fri, 01 May 2020 07:34:44 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr3050483uak.91.1588343683637;
 Fri, 01 May 2020 07:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 07:34:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
Message-ID: <CAD=FV=X76J9FAwtx4-8pjEkEqSo=2rz4Wv2ZR6c1Zps21b1E7w@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
