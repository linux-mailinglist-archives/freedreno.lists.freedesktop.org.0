Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A746726320
	for <lists+freedreno@lfdr.de>; Wed,  7 Jun 2023 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC77710E4FF;
	Wed,  7 Jun 2023 14:43:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DD310E4FF
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jun 2023 14:43:07 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30ad458f085so580053f8f.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jun 2023 07:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686148984; x=1688740984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
 b=iH7pl4QNui1hU+6JKz4/bUDAgdQYy03ZueQYLgxmh6OIy3u7Gx1wldh/KcHEiq+6kz
 /Vk/iu4XBqjg8U2XjuWn0BAvz2yomQV6DTDLPaBt33TM9xnkL7KTx6+9QfRjnYiWBxxP
 7lSGdu75EAUROtZNp1GiMCDTtrtLbEhh80noXR5Aq/52MX9Ya4ep1h65dqGxo0Vcy7ht
 Z2/KZzISCKKxY1U2ltcw40/Qkjlq+Soeu5uwySeDDck2fgWOMg/GHSxmVpqJ+rBfK9wN
 nE/gVlqnGX9oc6g6K8O0S4FytYEa4LnLPDFLy8G/8gsI6tD7tWXy2REN47hPUqFGwVZI
 96Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686148984; x=1688740984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
 b=kfxyNcmEDMuVdCfnVJDAyoDS+/ag2oFR8+8cGWHiWIZL4hFUwJSv6ZfsfD+uXnUMZ0
 yCL2TQVBkaUtgKPHDMQVtUJG3e6nrFt1bvNyA93Aje+K7kWUkcY1sK51roCKFUX5S9d/
 uIv10haR6A9YnaBZQlCdu1ySktQzazwa2AySOgXrW1w9ADLWEx2bt9PvrsRpkNFyXUi1
 Fpr+Y/ifMl+1YcFatAi8YrDcY24ujAtyDHLBPNcyUH0ZIqk6VNeo0MzFsjcrdZFq4bAE
 JfNO8FlDc+l/N04qH+FftP/5oTIdOU82quQ7knXt5gMr2pdTdEgHVI29mswLnJoQspD5
 kXFA==
X-Gm-Message-State: AC+VfDzXjjWV5bi1yrjiBCKQhPofOdoPFbpNXNlyMgLE2bE1Y8jTJgWo
 FJirje0mIuWO2uAQbhUl5cJSQw==
X-Google-Smtp-Source: ACHHUZ4BJFkUr8BQPVvtoygEGhGFQ/34JaENFvbKrT9Mxiyyf1zIQ0xfupRRBYQHPNv3qH+L0Ngz+A==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id
 p12-20020a5d458c000000b00309502995a9mr4791008wrq.32.1686148984213; 
 Wed, 07 Jun 2023 07:43:04 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j14-20020adff54e000000b0030aec5e020fsm15785659wrp.86.2023.06.07.07.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 07:43:01 -0700 (PDT)
Date: Wed, 7 Jun 2023 17:42:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: tidy up some error checking
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
> > @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >  	 * frequency divided by the no. of rows (lines) in the LCDpanel.
> >  	 */
> >  	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> > -	if (vsync_hz <= 0) {
> > -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> > +	if (!vsync_hz) {
> > +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
> >  				 vsync_hz);
> 
> Nit: no need to print the value here, you know it's zero.  Could be
> clarified to just "no vsync clock".
> 

Yeah.  That's obviously not useful.  Sorry, I will resend.

regards,
dan carpenter

