Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50C733BCF
	for <lists+freedreno@lfdr.de>; Sat, 17 Jun 2023 00:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966CC10E692;
	Fri, 16 Jun 2023 22:00:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CC610E11E
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 22:00:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B9B7740F37;
 Sat, 17 Jun 2023 00:00:03 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:00:02 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <uvfqlaez2jxiacacl7ndhuj4oqjtuboqz42sacxlavcxd3vqtf@hl7rajyglvc2>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <i5trozzoexkm7taojob4c53sajm2w6tnasj2yfzjy3a77oqvw7@wadk7g7op2kp>
 <3791f18c-89f1-f066-38c4-d8d13a3ab611@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3791f18c-89f1-f066-38c4-d8d13a3ab611@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-16 14:06:47, Abhinav Kumar wrote:
> On 6/14/2023 3:49 PM, Marijn Suijten wrote:
> > On 2023-06-14 14:23:38, Marijn Suijten wrote:
> > <snip>
> >> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >> corrupted with this series so something else on this series might be
> >> broken.
> > 
> > Never mind, this was a bad conflict-resolve.  Jessica's original
> > BURST_MODE patch was RMW'ing MDP_CTRL2, but the upstreamed patch was
> > only writing, and the way I conflict-resolved that caused the write of
> > BURST_MODE to overwrite the RMW DATABUS_WIDEN.
> > 
> > If both are moved to dsi_ctrl_config(), we could do a read, add both
> > flags in conditionally, and write.
> > 
> 
> So just to confirm, there is no issue on your 8350 setup with widebus 
> enabled right?

After properly conflict-resolving both series so that they either both
RMW, or combine the two bit-sets (the same you just discussed _not_
doing on the DPU side for DATABUS_WIDEN|COMPRESSION...) before a single
write, it works fine!

- Marijn
