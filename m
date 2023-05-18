Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70290707A7F
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 09:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4040D10E00B;
	Thu, 18 May 2023 07:03:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831F910E4DF
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 07:03:26 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C217C204E0;
 Thu, 18 May 2023 09:03:22 +0200 (CEST)
Date: Thu, 18 May 2023 09:03:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7obusvr5nxrg5bgvt5wyjv7tqjq66e6ebmda7smj6qaxi5plu2@6w2xrpy7odjl>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-7-git-send-email-quic_khsieh@quicinc.com>
 <82be767c-1c61-7685-5432-2f5f62bee9e8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82be767c-1c61-7685-5432-2f5f62bee9e8@linaro.org>
Subject: Re: [Freedreno] [PATCH v10 6/8] drm/msm/dpu: separate DSC flush
 update out of interface
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@gmail.com, andersson@kernel.org, freedreno@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-05-18 03:35:31, Dmitry Baryshkov wrote:
<snip>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 6292002..d5f3ef8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
> >   		enum dpu_dspp blk, u32 dspp_sub_blk);
> >   
> >   	/**
> > +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
> > +	 * No effect on hardware
> > +	 * @ctx: ctl path ctx pointer
> > +	 * @blk: interface block index
> > +	 */
> > +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
> > +		enum dpu_dsc blk);
> 
> Please align to the opening parenthesis.

I requested this change to a single tab specifically to match the rest
of the indentation of these callbacks.  Perhaps we should submit a
followup patch realigning all of them at once (and fixing the doc
comments, and and and...).

- Marijn

> > +
> > +	/**
> >   	 * Write the value of the pending_flush_mask to hardware
> >   	 * @ctx       : ctl path ctx pointer
> >   	 */
