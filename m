Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1E1C17EF
	for <lists+freedreno@lfdr.de>; Fri,  1 May 2020 16:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B196ECBD;
	Fri,  1 May 2020 14:39:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72E26E04A
 for <freedreno@lists.freedesktop.org>; Fri,  1 May 2020 14:39:25 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u203so2720575vkb.11
 for <freedreno@lists.freedesktop.org>; Fri, 01 May 2020 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
 b=SMxlHq5r/xlgb1aFLRF6VaIP1+SWFfbYQhAXjYZD4COiPW8KJ+YqJlOeUxHxCY5DlG
 Idx1WYR1HxdMRSDeEA2FIMDrtrlxs+zIzz57nuJsVPdb23kkRR6vDORPdekV6cr8T2ey
 XFPCDrZn+jfp9p8SrvmZa/jauPbMy65QXIIZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URjoa0IPAuVJrJzf1GzsjjCJgtImSI4fVU++g+IJyuo=;
 b=fJwKsebH5mFapAn+oVTRhFyJSpSqGdPRMo65zs/x3qpVQn4PtBPjduOkrmCgR3igTh
 C52wgSHgbqzGK1/JtOichIJpU3DklihXzUmX3fpINIUidkZTLLT37ordSpao04VqzNtB
 /VrW2Pd5Bg7EDc6/6Om9q+Fa/DW+DTv7kHigxY/d4N7murd5DeAtJwZ5fXxoltWciqqt
 2IEOwTm7j9QkgnPFktuTBAPLauCBquYMDZChSPnlbWF9CbSn4tLpYHAGoIE9TOEVrG4I
 vxP683yiekoX1+3ueisr0D8znun2eXKaE4WhI5w1rX01RkGKZ/r8FI1uvhwz531m5Rgv
 iSCQ==
X-Gm-Message-State: AGi0PubQQIyfQmlDE8Pe5CDOMRxBQgljxdKownASDhhGdrZMWEPVoyP5
 atMucvsi31lbQUhYhe/76hOTZJNaZKk=
X-Google-Smtp-Source: APiQypKzCaGDbKCNwZf0a39t5cV31mX2PBZHzX+XDAoAJuzP40lxuDvLffB7Do6teKbGMlPlZHvhrA==
X-Received: by 2002:a1f:2010:: with SMTP id g16mr2959002vkg.50.1588343964832; 
 Fri, 01 May 2020 07:39:24 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id a18sm795775vsq.7.2020.05.01.07.39.23
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 07:39:23 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id 1so6384890vsl.9
 for <freedreno@lists.freedesktop.org>; Fri, 01 May 2020 07:39:23 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr3484487vsq.109.1588343962687; 
 Fri, 01 May 2020 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 May 2020 07:39:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
Message-ID: <CAD=FV=W+uaPTZHKXq6WYgx-ZDL1QTedEpNw9T747UBD_g1O8CQ@mail.gmail.com>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 1/2] arm64: dts: qcom: sc7180: Add A618 gpu
 dt blob
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
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> * Remove GCC_DDRSS_GPU_AXI_CLK clock reference from gpu smmu node.
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)

This is the newer version of the patch:

https://lore.kernel.org/r/1581320465-15854-2-git-send-email-smasetty@codeaurora.org

The change to remove the extra IOMMU clock matches our discussions and
there's no longer anything blocking this from landing.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
