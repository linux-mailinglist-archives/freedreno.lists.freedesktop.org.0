Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F1470D536
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00E210E3D5;
	Tue, 23 May 2023 07:36:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583B710E3F4
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 07:36:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-309438004a6so4360292f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 00:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684827389; x=1687419389;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pC084T4AC5q3ax2QdOfZ3dY5bQQmhqPKD9PLtePXW20=;
 b=KM3bEpaPTwBCSGJqFp8ac0cya42Xrl+3TWW5Z7fJB69ISHLC8f86hYbjb4yK1D9fUC
 YM7bthl0MpdM4G8rVsbtYGanKSwxUgjXDNciwWQU13Ga7jnF3t05vY/l5DE6AA0WIJMr
 iyF3V4pvN3Ea32fzOL4wU2t1o6yWWddnyJTgl+0aemxDYaebo2pYzeOxSRkdP8u8hRP7
 upTMq2LGYIld9Ix8QeTJ7OQoIZ+h1tSACz3rjK+fHTI58tWrE2j8w0BL9kMEFEgNYmhH
 i3/xXB9IfWoC68WGjTxfpaSkGSD09rG5olrDarbui+ieLcQSLnwFyQXcGVDXiAWYRLo9
 cJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684827389; x=1687419389;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pC084T4AC5q3ax2QdOfZ3dY5bQQmhqPKD9PLtePXW20=;
 b=HHMq7WeX6A7OHzpQW8pdvzO6MF+1eWwAGUCSAovNbl105mGeS/7fBebMuKxlYQacsX
 bK5zUr4g9mMmLphVMInZJE9Q8PVd9YlGCfGk8AUPP/wKQMMIdZ7t5CjqWKqJP2LMxIkA
 MEuribDcWCcyN9H0VKuOycB+07T0kFOASCBEIuQmGHlWcFuFahRThcvUA9XnlpYIiZMW
 I7pzLv91W6QBW6Kbeq1OJ/oknExZnjN4bIb/hZNml3F4pUxIosOxTpdlWZIIpkBgO+IT
 70rCm9RHzsSLjFnsrNUZ9uYq84F+PXlsmhVo8s1rbuedVG5B6JHfZj3yTKjZcf8XppK0
 W1yA==
X-Gm-Message-State: AC+VfDyV05zo1yYgAwBaBJz0yvstkEbZSwp+v03Mp3dEhFY8kAusPHmj
 yF02ROmq7/3Gtj+yGImkMF74rw==
X-Google-Smtp-Source: ACHHUZ5/0RMEh67ZKH6MYxhAyzhh0F9JXcO5ASWrP58GkVZ3xZKScCjgMSbBL0bprhm72B4/0I7ydA==
X-Received: by 2002:adf:fe01:0:b0:30a:93ad:ab9f with SMTP id
 n1-20020adffe01000000b0030a93adab9fmr3474619wrr.11.1684827389434; 
 Tue, 23 May 2023 00:36:29 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 z11-20020adff1cb000000b0030789698eebsm10068395wro.89.2023.05.23.00.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:36:27 -0700 (PDT)
Date: Tue, 23 May 2023 10:36:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Message-ID: <b8bcb789-55c4-4169-be3f-4153d14c0ef9@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [bug report] drm/msm/dpu: add HDMI output support
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Dmitry Baryshkov,

The patch ea767bb1752f: "drm/msm/dpu: add HDMI output support" from
Apr 15, 2023, leads to the following Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:647 _dpu_kms_initialize_hdmi()
	error: uninitialized symbol 'i'.

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
    620 static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
    621                                     struct msm_drm_private *priv,
    622                                     struct dpu_kms *dpu_kms)
    623 {
    624         struct drm_encoder *encoder = NULL;
    625         struct msm_display_info info;
    626         int rc;
    627         int i;
    628 
    629         if (!priv->hdmi)
    630                 return 0;
    631 
    632         encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
    633         if (IS_ERR(encoder)) {
    634                 DPU_ERROR("encoder init failed for HDMI display\n");
    635                 return PTR_ERR(encoder);
    636         }
    637 
    638         memset(&info, 0, sizeof(info));
    639         rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
    640         if (rc) {
    641                 DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
    642                 drm_encoder_cleanup(encoder);
    643                 return rc;
    644         }
    645 
    646         info.num_of_h_tiles = 1;
--> 647         info.h_tile_instance[0] = i;
                                          ^
Uninitialized.

    648         info.intf_type = INTF_HDMI;
    649         rc = dpu_encoder_setup(dev, encoder, &info);
    650         if (rc) {
    651                 DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
    652                           encoder->base.id, rc);
    653                 return rc;
    654         }
    655 
    656         return 0;
    657 }

regards,
dan carpenter
