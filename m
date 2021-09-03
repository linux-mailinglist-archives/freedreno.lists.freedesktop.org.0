Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3854004F8
	for <lists+freedreno@lfdr.de>; Fri,  3 Sep 2021 20:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94C56E8C3;
	Fri,  3 Sep 2021 18:40:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40326E8C3
 for <freedreno@lists.freedesktop.org>; Fri,  3 Sep 2021 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630694421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWtF9jf2Zkp/EIHUVbxUvuUljulDqbFLTLzbdRX5bvg=;
 b=I8B31O8eeLnxKdukWOFfP+Zv0qyRjBODHk4R5Ia1y88Yazh2xMdANy2eHGmX78OeR7K7Q5
 d8tE0kB9LH8oWfgdFQdc2rLqvOCWBA79K7GxLKMJMBtzS/a/RCSss+1DeWQTCVXhM54IMX
 Dmq/3fR8Le4wzCFpXDfAQRfEM1Oweno=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-XaNuxQvUOeCLn-gFMsThpw-1; Fri, 03 Sep 2021 14:40:20 -0400
X-MC-Unique: XaNuxQvUOeCLn-gFMsThpw-1
Received: by mail-qk1-f199.google.com with SMTP id
 y185-20020a3764c20000b02903d2c78226ceso6637638qkb.6
 for <freedreno@lists.freedesktop.org>; Fri, 03 Sep 2021 11:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aWtF9jf2Zkp/EIHUVbxUvuUljulDqbFLTLzbdRX5bvg=;
 b=tqYBg9lD6ljY4gipHbtx+ins6wcHvlm+1gu0NBUeJePGhGUMHIqhjlYIMe+cvowwlP
 ssuwIWKVyrL69XbfB71cdwYQ3wdeyShACwylxOk3+IyIJ9YXiL0hFIAKKKiVcDdzxD3u
 J42cSrTEtI8zd+Z5lxwf6ETPSfOeJVthAHzxYhws3FbfQRHYQyHKcHR4DWeK5orsWP2t
 XYYx96jAxIrsZkQM2t+kbsKP3kH0u7gqoxDFN+S+qh0aJ/fHW4bYvOfGISp0x0BizqZe
 3Qxvt3zb7iVwc61NOexBsXaLdp6oj+EkLX/kknwuuLN62BxCWgVhBiYBT0HCr6gSwM03
 uZsg==
X-Gm-Message-State: AOAM533qi5cEsj52RNsH2WkcNJuBENEeO/rF2OradnnYoq/J4govLB8g
 lIkEldO/HX51xhZmiCttxOFwPwa+x6tDeG336C18uK1zJjt7IzEtl53U7NZdh+3NzQ5bnT/DDqe
 SKFWTdNYerHVdYDextxAx8cphvirR
X-Received: by 2002:a05:620a:2e4:: with SMTP id
 a4mr241544qko.288.1630694419567; 
 Fri, 03 Sep 2021 11:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqVC1TcFhJm7LcUohfzVUt093xlPQkNtnzfm7+W7zSXklTGCQY6X98oT4Qb3UWtx1UAb1ngA==
X-Received: by 2002:a05:620a:2e4:: with SMTP id
 a4mr241518qko.288.1630694419233; 
 Fri, 03 Sep 2021 11:40:19 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id a189sm4443447qkf.114.2021.09.03.11.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:40:18 -0700 (PDT)
Message-ID: <ca29cfea709f54f74899900068bddcd838d5ab2c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, cgel.zte@gmail.com, 
 robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, 
 laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
 treding@nvidia.com,  linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Date: Fri, 03 Sep 2021 14:40:17 -0400
In-Reply-To: <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
 <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
 <52a6c92d-fe59-cdb8-23de-6fcda6ca2c68@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable
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

On Fri, 2021-09-03 at 21:31 +0300, Dmitry Baryshkov wrote:
> On 02/09/2021 21:40, Lyude Paul wrote:
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Do you need me to push this?
> 
> We'd pick this up through the msm tree.

ah-totally forgot msm had their own tree and didn't go through drm-misc-next.
Thanks!

> 
> > 
> > On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
> > > From: Chi Minghao <chi.minghao@zte.com.cn>
> > > 
> > > Fix the following coccicheck REVIEW:
> > > ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> > > 
> > > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > > Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
> > > ---
> > >   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > index 4fb397ee7c84..3610e26e62fa 100644
> > > --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> > > @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
> > > *ctrl)
> > >   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
> > >                  struct drm_connector *connector, struct edid **edid)
> > >   {
> > > -       int ret = 0;
> > > -
> > >          mutex_lock(&ctrl->dev_mutex);
> > >   
> > >          if (ctrl->edid) {
> > > @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl
> > > *ctrl,
> > >          }
> > >   unlock_ret:
> > >          mutex_unlock(&ctrl->dev_mutex);
> > > -       return ret;
> > > +       return 0;
> > >   }
> > >   
> > >   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> > 
> 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

