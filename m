Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E831B268BA4
	for <lists+freedreno@lfdr.de>; Mon, 14 Sep 2020 15:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DE86E21C;
	Mon, 14 Sep 2020 13:02:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA596E21C
 for <freedreno@lists.freedesktop.org>; Mon, 14 Sep 2020 13:02:53 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B279208DB
 for <freedreno@lists.freedesktop.org>; Mon, 14 Sep 2020 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600088573;
 bh=I7uu9k5J59QfQz6sUGY7XLC+T0P4UT5FiNyW8J2xsKw=;
 h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
 b=WB8P/aQYITZ/PdnBYQNfOcflUYdxCfmApbyR2CDi7EpAwN3cPSUhc5cLQ2mXEUmpt
 LuRD06ikEvz57eeae9QEIS7jVGXvTjWcZUR/UBApY4pOwN/fpcp4lr6fDO5n5GNsvj
 F5s1Oqo0d7ojqcZjcV81AZXJ9xbWQI+8zcuRyud4=
Received: by mail-il1-f178.google.com with SMTP id a8so16671655ilk.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Sep 2020 06:02:53 -0700 (PDT)
X-Gm-Message-State: AOAM53101vQORWci6Gn6VIMt8+vo1U3ZlUxS9Eq3XR/gN/FuMbcjjJcy
 gAKgl2JaVaAqV3h0XlWnjgdRIcXCNEAm6ZmoFXU=
X-Google-Smtp-Source: ABdhPJwK/NQbNsIWAMGhCBNT1m8HITK2wiprQm9FNIoHVN3yzPuR3pZNyU3kyBnkVvprJDZOnSz/am7zJ75n44cNtg0=
X-Received: by 2002:a05:6e02:d2:: with SMTP id
 r18mr11529430ilq.303.1600088572804; 
 Mon, 14 Sep 2020 06:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200908171114.GA12080@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200908171114.GA12080@jcrouse1-lnx.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 14 Sep 2020 09:02:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6-36rhUj+y+yRAT2VMkM-tLObrEO_Dy1X65o9AfyyGSg@mail.gmail.com>
Message-ID: <CA+5PVA6-36rhUj+y+yRAT2VMkM-tLObrEO_Dy1X65o9AfyyGSg@mail.gmail.com>
To: Linux Firmware <linux-firmware@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux-arm Msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [Freedreno] Adreno GPU microcode update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 1:11 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> The following changes since commit d5f9eea5a251d43412b07f5295d03e97b89ac4a5:
>
>   wl18xx: update firmware file 8.9.0.0.83 (2020-09-01 08:07:59 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/CosmicPenguin/linux-firmware.git for-master
>
> for you to fetch changes up to f48fec44127f88ce83ea1bcaf5824de4146ca2f9:
>
>   qcom: Add updated a5xx and a6xx microcode (2020-09-08 10:03:36 -0600)
>
> ----------------------------------------------------------------
> Jordan Crouse (1):
>       qcom: Add updated a5xx and a6xx microcode
>
>  qcom/a530_pfp.fw | Bin 15876 -> 16144 bytes
>  qcom/a630_sqe.fw | Bin 31316 -> 32056 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

Pulled and pushed out.

josh

>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
