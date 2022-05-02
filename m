Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF847516C19
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 10:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747110FD33;
	Mon,  2 May 2022 08:34:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106A610FD32
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 08:34:46 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5CA023F398;
 Mon,  2 May 2022 10:34:44 +0200 (CEST)
Date: Mon, 2 May 2022 10:34:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <20220502083442.t365cfmivlga557g@SoMainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
 <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2022-05-01 16:56:45, Abhinav Kumar wrote:
> [snip]
> Wouln't this macro already make sure that 'reg' doesnt have anything in 
> the top 16 bits? Its doing a & with 0x00003f00

Like I said, it is unlikely that this happens, only if someone starts
changing the code that assigns to `reg` which is unlikely to pass review
anyway.

> [snip]
> We can have a common bitfield layout for the two channels for command mode.
> 
> So we can do something like below for common fields:
> 
> -static inline uint32_t 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
> +static inline uint32_t 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM_DATATYPE(uint32_t val, uint32_t 
> stream_id)
>   {
> -       return ((val) << 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & 
> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
> +       return ((val) << 
> (DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT + (stream_id 
> * 16)) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
>   }
> 
> Video mode can also use all of these except for WC as that field is not 
> present for cmd modes.
> 
> This can go as a separate change .
> 
> I can push this and perhaps get a Tested-by from Vinod as I dont have a 
> setup to re-validate this.

How would you represent this in XML?  I was hoping for a method that
allows to construct the value in a generic way, without register names,
and then simply have a "register macro" that moves (and perhaps masks)
the preconstructed value into the right place.  A bit like how `enum`s
are currently set up in XML, but with bit ranges for the values and
macros to set a value.

I think I've _partially_ found what I was looking for: a `<bitset>`.
However, I don't know if we can utilize this multiple times within a
single `reg32`, once with an offset for stream1.  Alas, it's just
bikeshedding at this point.

- Marijn
