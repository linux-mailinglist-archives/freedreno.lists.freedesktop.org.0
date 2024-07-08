Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE592AC14
	for <lists+freedreno@lfdr.de>; Tue,  9 Jul 2024 00:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B6D10E011;
	Mon,  8 Jul 2024 22:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IJjYzmFq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A247910E011
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2024 22:30:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5CDEBCE0B28;
 Mon,  8 Jul 2024 22:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840FEC116B1;
 Mon,  8 Jul 2024 22:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720477824;
 bh=6JE4nXgPjNuNNKkaz7S9Z+jMtV6+A3O6FZtrLMEM12A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IJjYzmFqXld0rCCL1yctkm1fasws1Rm+7t1VBj2mq0b6euuf8ABB71wzAJrty8O2G
 K5CywZPbZtVyyR8hH9SYhOY39tKlEN93AFDVc88R6OffnYyoRd57NFYWQAZZXnGzbr
 z7xTYQe9XikxLKRkm4gXbD2/H3aZshD4GMy/kf/zShqFz7WCL924biOkRfoEkCVteW
 urLIIHbHWDZsugmMuUcI4w6lSY9L+MPHNOZYIRTHzFBmXVPpFfsS1Qw0ErrnM2EL2A
 gwHfK06RmPSm4SeVhnqLpHv1pdNz/B6+yk7brHL+f/nBZ3LtZrx1RA6A8OcEKnw/9r
 nWdcmU+rgCBEA==
Message-ID: <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Mon, 08 Jul 2024 15:30:22 -0700
User-Agent: alot/0.10
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> The GPU clock controllers use memory region that is a part of the GMU's
> memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> GPU driver can use devm_ioremap_resource for GMU resources.

Why does GMU map the gpu clk controller? Does it use those registers? We
don't want to allow two different drivers to map the same region because
then they don't coordinate and write over things.
