Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF84716EA
	for <lists+freedreno@lfdr.de>; Sat, 11 Dec 2021 22:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA410E35C;
	Sat, 11 Dec 2021 21:57:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626FC10E365;
 Sat, 11 Dec 2021 21:57:22 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 07868202E0;
 Sat, 11 Dec 2021 22:57:20 +0100 (CET)
Date: Sat, 11 Dec 2021 22:57:18 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20211211215718.pe675o5wvculxavc@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, abhinavk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
 <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
 <20211211213528.uroqfdksvokspbxf@SoMainline.org>
 <CAA8EJprT5gcWOsS5jJk8egUpxutBpUdW2Pnh-8FFXhgOd3hr=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprT5gcWOsS5jJk8egUpxutBpUdW2Pnh-8FFXhgOd3hr=A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on
 command mode panels
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 paul.bouchara@somainline.org, robdclark@gmail.com, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, sean@poorly.run,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-12-12 00:49:09, Dmitry Baryshkov wrote:
> On Sun, 12 Dec 2021 at 00:35, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > [..]
> > On this note, does it perhaps make more sense to call the "internal"
> > _dpu_encoder_phys_cmd_wait_for_idle function directly, instead of going
> > through the "public" dpu_encoder_phys_cmd_wait_for_tx_complete which
> > seems solely intended to handle the wait_for_tx_complete callback?
> 
> Either one would work. The main difference is the error message. Do
> you want to see it here if the wait times out or not?

I prefer calling _dpu_encoder_phys_cmd_wait_for_idle directly and
optionally adding our own error message.  IIRC DRM_ERROR prints source
information such as the function this originated from, and that makes it
impossible to distinguish between the wait_for_tx_complete callback or
the invocation through dpu_encoder_phys_cmd_wait_for_commit_done anyway.

- Marijn
