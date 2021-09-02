Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE63FF355
	for <lists+freedreno@lfdr.de>; Thu,  2 Sep 2021 20:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BA96E7DC;
	Thu,  2 Sep 2021 18:41:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9A56E09F
 for <freedreno@lists.freedesktop.org>; Thu,  2 Sep 2021 18:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630608063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
 b=i3Q0mECxGd2NdWzq6oZ1wNm1mNzoSPQLGlhYDz179t/wl/zBQeOkhBq1iyKWEsuUxe+AIH
 eS/2lROe2WSiH5coDCelKkaL3ES7rBvEua+7yTE+T/vEybm27f0nW6TD8zX238etaNnYzr
 a07g8X5GvUN8TGUEcJJvpVgR+QoRPmU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-VLlOX_5XMBik0vNgEaQMsw-1; Thu, 02 Sep 2021 14:41:02 -0400
X-MC-Unique: VLlOX_5XMBik0vNgEaQMsw-1
Received: by mail-qk1-f200.google.com with SMTP id
 p23-20020a05620a22f700b003d5ac11ac5cso3258666qki.15
 for <freedreno@lists.freedesktop.org>; Thu, 02 Sep 2021 11:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Bj1YZCOICCuWhBGeiWp2KDW8cxmxWvm+507OpITl/f8=;
 b=dX/TkXbRM6a5cfYrMJn69H9pMAmKRIK+S2mlCSE7pasqB5jC9woYQdhJZtEi4XkEbB
 WMM8VZACq8w+2mJF+fJqBqm1b6PyKqpEGhSMoxuUgyG925v5slZ2kJTJPmLj7oeh5rRY
 wUqC7wbgcxfNbbfwhr/IWIm2Lnr5EhQhMmThdijMf5rkax0+pe3momsLr0UJUHhZjazB
 n9ldvqkPfom2OfV2UmIuy0n8oMZpFXHOibISrCe+1QncwklslHodAELTyWfWtXg5heeo
 nZ2Zu4CoTo5XsRv1kUuO4KK7g7kUsXlEaYmbyQMIwyndRmJxnFksT0/G5oPm3Hub394W
 VLpQ==
X-Gm-Message-State: AOAM532hklSuMpvfC8LbLa+Bl3+iOVGnoXuQXjJJqIwyKeKeNzrUaTNs
 fVFB8JXwp9E7uy74Jhb3Q88I2C9ioMd+3yCyWZdBw510q03el/Fy6yDxdInQPnz++9C5Gn4jim6
 wtnJBaxG2QAwbkm5Jn3Dl2E5nTOIQ
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422771qtc.158.1630608061769; 
 Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzER9U7aKRPWcbQbf6Y4ZH5pTc8T3UJYAdtuN5uesnicOA+1yjnC5jy8JOV95bM70GmgFDNcw==
X-Received: by 2002:ac8:7ef6:: with SMTP id r22mr4422741qtc.158.1630608061430; 
 Thu, 02 Sep 2021 11:41:01 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id p22sm1995353qkj.16.2021.09.02.11.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 11:41:00 -0700 (PDT)
Message-ID: <2d6784e3327cab7bfdc88ca1ef7c9c4c9cca113a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: cgel.zte@gmail.com, robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, 
 laurent.pinchart@ideasonboard.com, chi.minghao@zte.com.cn,
 treding@nvidia.com,  linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Date: Thu, 02 Sep 2021 14:40:59 -0400
In-Reply-To: <20210831115127.18236-1-chi.minghao@zte.com.cn>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Do you need me to push this?

On Tue, 2021-08-31 at 04:51 -0700, cgel.zte@gmail.com wrote:
> From: Chi Minghao <chi.minghao@zte.com.cn>
> 
> Fix the following coccicheck REVIEW:
> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..3610e26e62fa 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl
> *ctrl)
>  int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>                 struct drm_connector *connector, struct edid **edid)
>  {
> -       int ret = 0;
> -
>         mutex_lock(&ctrl->dev_mutex);
>  
>         if (ctrl->edid) {
> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>         }
>  unlock_ret:
>         mutex_unlock(&ctrl->dev_mutex);
> -       return ret;
> +       return 0;
>  }
>  
>  int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

