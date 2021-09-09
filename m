Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF14405ADE
	for <lists+freedreno@lfdr.de>; Thu,  9 Sep 2021 18:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9167F6E8B6;
	Thu,  9 Sep 2021 16:26:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12CF6E528
 for <freedreno@lists.freedesktop.org>; Thu,  9 Sep 2021 16:16:14 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4H53z06Xcgz4x5jK
 for <freedreno@lists.freedesktop.org>; Thu,  9 Sep 2021 16:16:12 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr
 header.b="Bwja9UO1"
Date: Thu, 09 Sep 2021 16:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631204166;
 bh=Apv6GQaf8fKyhLu5mqniN1a3E749tLdfKHwBJJCqpnM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Bwja9UO1rUqLY5hqjqW8ns3FrWLdpUn9SyKSzlHRCF//Yngt12sVjx7jaryvLbXrF
 HqfFGr6Le7ohW1gp6JokPdA1qk7+6ICL8CvqGulmwqjEdzHxvG/eivDp49v2FWYvU9
 2LJmaaBmXgzRbIeHDbAAugPlgU4hlCzu//WiySq4NkRR9uheLEMgxboG+iCR7ZSgn4
 O4iCuvQHWhvstlDqtdQbhFwPwMAdSM3cW4y64wu8Mmhd5fZRhQ8sRHQojxn++hOaCS
 zwiVsa+uK0yDM/ekde0NPPjy8MwNL/94DN1TbKuCEE4x8V79RHTaUxZtW4xyuBfEM3
 H0/oo/bRurDgg==
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo@padovan.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Luben Tuikov <luben.tuikov@amd.com>,
 Melissa Wen <mwen@igalia.com>, Steven Price <steven.price@arm.com>,
 Tian Tao <tiantao6@hisilicon.com>
Message-ID: <i-XmBd_5J3_d8cdm-IT6Ery2kHN0FPZCX968aU5idvxQxNlvDJguLLThtF2NF15LF8gGsH4uI2w0s0CL_39KGpzoGpuCgcz2_-4Wjf3AYEM=@emersion.fr>
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Thu, 09 Sep 2021 16:26:43 +0000
Subject: Re: [Freedreno] [PATCH v3 0/9] dma-fence: Deadline awareness
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Out of curiosity, would it be reasonable to allow user-space (more
precisely, the compositor) to set the deadline via an IOCTL without
actually performing an atomic commit with the FB?

Some compositors might want to wait themselves for FB fence completions
to ensure a client doesn't block the whole desktop (by submitting a
very costly rendering job). In this case it would make sense for the
compositor to indicate that it intends to display the buffer on next
vblank if it's ready by that point, without queueing a page-flip yet.
