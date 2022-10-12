Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E695FC9B7
	for <lists+freedreno@lfdr.de>; Wed, 12 Oct 2022 19:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FBD10E6C8;
	Wed, 12 Oct 2022 17:08:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0210E277
 for <freedreno@lists.freedesktop.org>; Wed, 12 Oct 2022 17:08:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DD6EB81B80
 for <freedreno@lists.freedesktop.org>; Wed, 12 Oct 2022 17:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51050C433B5
 for <freedreno@lists.freedesktop.org>; Wed, 12 Oct 2022 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665594496;
 bh=82JcEb/mOeuKvVFFth9N70IVoiMKS9+VBMUfpKHOQLA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=lOecsqDL5n5X+lEjCdAKBo32UwPxMsnl83JMhv4k3km1Y/oUswtVWwbW1lbnvm5Yz
 AwBasXlOX/fys+MuiL8Jm51u9KZ8xRSkB78ePqVnXpgerqUb1MJswO8zpRm93z2iie
 YR9K25aIbY0OlO84Nx7ptJ2pMjwWFFd/EzlGHirW8SLqAXygxdYJHNZAwb1MWX2S0B
 xwTOREnB4LgTY3sbuHxsV/QVt8VGJPXBhijmolmg2EaZt5BCOxSOunQ9TxaKcSX7wn
 UP7vWQ24Jlcy9dCiLR77els08wegRpp5/BfkGhOncD1vHYM6OrjSF4NpXFtjuhcE/L
 hskfojXkcn/ng==
Received: by mail-oo1-f51.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso12546605ooq.6
 for <freedreno@lists.freedesktop.org>; Wed, 12 Oct 2022 10:08:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf2DtaZjyVKqNMMg2mYhu1S/Ibs5oDWUkRepzKC7007tfYLF9CWY
 w91sDrZ+fzWwN2+hrDcJDhtGxiMEwm9G1ei2nJc=
X-Google-Smtp-Source: AMsMyM4qk3w6rDeoYnzq8IA9dBvLHotj7W1REdKbRhOxqltx7Z5SMfXisJDPj16EUmt0svsaHcXPJM4x3EEm+vAlssU=
X-Received: by 2002:a05:6830:44aa:b0:661:955d:c346 with SMTP id
 r42-20020a05683044aa00b00661955dc346mr8018042otv.160.1665594495432; Wed, 12
 Oct 2022 10:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:08:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7OHtAm9YBrWcgSrqn3U__QvdyxRFx1P2EFjAdnC_qmWA@mail.gmail.com>
Message-ID: <CA+5PVA7OHtAm9YBrWcgSrqn3U__QvdyxRFx1P2EFjAdnC_qmWA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PULL] qcom: add squashed version of a530 zap shader
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 linux-firmware@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 10, 2022 at 6:45 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:
>
>   linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware a530-mbn
>
> for you to fetch changes up to 44fa25ddf7d803f347dcdb0ecc52f72268979b92:
>
>   qcom: add squashed version of a530 zap shader (2022-10-11 01:31:10 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qcom: add squashed version of a530 zap shader

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                    |   1 +
>  qcom/apq8096/a530_zap.mbn | Bin 0 -> 17188 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/apq8096/a530_zap.mbn
