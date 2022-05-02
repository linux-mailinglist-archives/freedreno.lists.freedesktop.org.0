Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C6516F8F
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 14:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D66E10E6B1;
	Mon,  2 May 2022 12:27:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182A710E751
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 12:27:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48E7AB816EC
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 12:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF3DC385B1
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651494471;
 bh=F22CXtfjaswX/RIVy0o1ELnLuHXBrSDCtvxh5+5BuGk=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=PxNDwE9oveyU1dkcqLh4cINW+Eh/jho7246TTMrIzO44NPvZzLSekeSJpQZGPwo67
 a641y3elXpADfrjMZ/O1B8rTAbiTZQAPilDI8zYldxULOvPSb+Z8D+B1nhxalx03bw
 qyJyj1vPSQRd4mV9yZbwa/F4LIz4hHK5pwsgmAKWkhpDxY4a5BiRUHsEYTTvp7Xvc8
 ds1SuGykfWGqCg7b+QtX1Y36BFpLzinxKchGleY0kQkrwaTs1w/p1TKzLjyI9FQ57X
 wUP1lnDgcnyXceV2qt+B+t1gB+90WhmPXm51IbRGzGkE7zvAlLA4u5SR/Eb7bPXxIJ
 z1f8+H9F+NtSg==
Received: by mail-io1-f43.google.com with SMTP id 125so15791980iov.10
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 05:27:51 -0700 (PDT)
X-Gm-Message-State: AOAM530evcAF8iVNx/+8esQTpQjkChuJfBxBkASftlTT6wMvsQJrgjlm
 ZvfzE3QxBGhmmlwnKPWRUm3MPpGIPgHMus+HIgM=
X-Google-Smtp-Source: ABdhPJy6t3KWKaYJ/+ayQK5srFzIHgzPp9J45DJXokkT0gGFaZugQR5BjiCAz6jLjhtEgaFfvbzBdBYkU9JgpMfxSqU=
X-Received: by 2002:a02:a507:0:b0:32b:543:d66 with SMTP id
 e7-20020a02a507000000b0032b05430d66mr4435964jam.146.1651494470248; 
 Mon, 02 May 2022 05:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:27:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6XxM4eGLL4oOx3g5hxn1Yv7xnhz8K4rKAOdL-4bivSQQ@mail.gmail.com>
Message-ID: <CA+5PVA6XxM4eGLL4oOx3g5hxn1Yv7xnhz8K4rKAOdL-4bivSQQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PULL] qcom: add firmware for several Adreno
 generation
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
Cc: Linux-arm Msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 Linux Firmware <linux-firmware@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 4:45 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Please pull the firmware for several generation of Adreno GPU (A220, A330,
> A405/A420/A430).
>
> The firmware files come from Dragonboard 820c BSP available at [1] or directly
> from Qualcomm at [2] (registration is required).
>
> [1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
> [2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip
>
> The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:
>
>   Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware adreno-firmware
>
> for you to fetch changes up to dfa3c4c30996376dbc3adb530c0505b2efad583b:
>
>   qcom: add firmware files for Adreno a420 & related generations (2022-04-26 23:36:27 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       qcom: add firmware files for Adreno a220
>       qcom: add firmware files for Adreno a330
>       qcom: add firmware files for Adreno a420 & related generations

Pulled and pushed out.

josh

>
>  WHENCE               |   6 ++++++
>  qcom/a330_pfp.fw     | Bin 0 -> 2212 bytes
>  qcom/a330_pm4.fw     | Bin 0 -> 9220 bytes
>  qcom/a420_pfp.fw     | Bin 0 -> 4292 bytes
>  qcom/a420_pm4.fw     | Bin 0 -> 9556 bytes
>  qcom/leia_pfp_470.fw | Bin 0 -> 1156 bytes
>  qcom/leia_pm4_470.fw | Bin 0 -> 9220 bytes
>  7 files changed, 6 insertions(+)
>  create mode 100644 qcom/a330_pfp.fw
>  create mode 100644 qcom/a330_pm4.fw
>  create mode 100644 qcom/a420_pfp.fw
>  create mode 100644 qcom/a420_pm4.fw
>  create mode 100644 qcom/leia_pfp_470.fw
>  create mode 100644 qcom/leia_pm4_470.fw
