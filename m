Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA232E9A
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2019 13:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016289012;
	Mon,  3 Jun 2019 11:27:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Mon, 03 Jun 2019 11:27:01 UTC
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E3289012
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jun 2019 11:27:01 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id C725068AA6; Mon,  3 Jun 2019 13:17:05 +0200 (CEST)
Date: Mon, 3 Jun 2019 13:17:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <20190603111705.GA27163@lst.de>
References: <20181201165348.24140-1-robdclark@gmail.com>
 <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <4864dc3e-6e04-43e5-32c8-2cf5a0705fe5@codeaurora.org>
 <CAF6AEGuFyk1DJWUcQTnW=xsEUhYTYJccjzHJFxvipK4M8UdrUA@mail.gmail.com>
 <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFp+6iGexVjbak8RQhEQNPp5cV8PK2ubTNNCMyaFPqdTGAbJ0A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 <devicetree@vger.kernel.org>, Archit Taneja <architt@codeaurora.org>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SWYgeW91IChhbmQgYSBmZXcgb3RoZXJzIGFjdG9ycyBpbiB0aGUgdGhyZWFkKSB3YW50IHBlb3Bs
ZSB0byBhY3R1YWxseQpyZWFkIHdoYXQgeW91IHdyb3RlIHBsZWFzZSBmb2xsb3cgcHJvcGVyIG1h
aWxpbmcgbGlzdCBldHRpcXVldHRlLiAgSSd2ZQpnaXZlbiB1cCBvbiByZWFkaW5nIGFsbCB0aGUg
cmVjZW50IG1haWxzIGFmdGVyIHNjcm9sbGluZyB0aHJvdWdoIHR3bwpwYWdlcyBvZiBmdWxsIHF1
b3Rlcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJl
ZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
