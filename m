Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52A25126A
	for <lists+freedreno@lfdr.de>; Tue, 25 Aug 2020 08:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD196E866;
	Tue, 25 Aug 2020 06:52:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838CC6E866;
 Tue, 25 Aug 2020 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=armWkMQMHeWrynpzAyMGDG4PU5wuW/KKgxbsJRkV43I=; b=I1lZGQbd6rbpBgflacnAax4B0r
 vbN7m8CVPH8CUuLie3QdwDiSFXvWUbAcHtlfU7zS7SW3k+9g0gO2EJAEGKN2VUQElPCexSD2MXBrL
 i8q4QuNOyKwUIk1nE+lg0Fc3ezIRSTWBbRvcWgSu869Z/NyEEolBPQRGB/ZZ2msFNKoD08aLP7JQl
 SlAVnjJzH3Qv9BCndirRZWXwUMkqhY0ZMeLZqzCKNI+3tg6KP84pevsKUF9glXL93hkC7vlXeYwYE
 ae8SxS9nGxrj9V7/Ed/KT8cwErR+S2BDSGIg7QE8XuSi1xwogew3rPIu4dNT8xCNBN8DdmYE5ycQP
 hRrkDqyA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kASoi-0000e9-Se; Tue, 25 Aug 2020 06:52:26 +0000
Date: Tue, 25 Aug 2020 07:52:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200825065224.GB30014@infradead.org>
References: <20200822175254.1105377-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200822175254.1105377-1-robdclark@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Freedreno] [PATCH] drm/msm: drop cache sync hack
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Aug 22, 2020 at 10:52:54AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that it isn't causing problems to use dma_map/unmap, we can drop the
> hack of using dma_sync in certain cases.

Great to see!  What did solve the problems?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
