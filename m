Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92A708A9E
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 23:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE0810E558;
	Thu, 18 May 2023 21:36:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26B610E558
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 21:36:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2A2DC203B0;
 Thu, 18 May 2023 23:36:13 +0200 (CEST)
Date: Thu, 18 May 2023 23:36:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <dexkdzb3wo3jjveys4i2ujh22fbyti5kugie7nl23s7lv63pky@ryycjghsifva>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
 <20230428223646.23595-4-quic_abhinavk@quicinc.com>
 <kap4lpzbv5qihf2k7fdznmx72hrhpx4acjgcng45kxnshxo6ge@gzke6ruy3x6u>
 <2c688487-a5b1-155c-f73a-69358d03e478@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c688487-a5b1-155c-f73a-69358d03e478@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK
 from hw catalog
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-19 00:26:33, Dmitry Baryshkov wrote:
> On 18/05/2023 22:41, Marijn Suijten wrote:
> > On 2023-04-28 15:36:46, Abhinav Kumar wrote:
> >> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
> >> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> > 
> > is *the* same
> 
> And, I think, a comma is missing before DSPP_MSM8998_MASK.

Possible, but not needed I think; both would work.

> Note: since the English language is not native for most of the 
> developers, I usually don't nitpick on these issues provided we can 
> understand the message without too much trouble (and the mistake doesn't 
> stand out aloud, begging for it to be fixed).

I hope you don't mind me pointing them out when they make the reader go
"huh, a word is missing here", breaking my sentence-parser.

- Marijn

> I will fix missing articles when applying, if I don't forget.

<snip>
