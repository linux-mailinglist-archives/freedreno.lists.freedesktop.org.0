Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AD80363A
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 15:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A22310E270;
	Mon,  4 Dec 2023 14:17:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3510E264
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9bd3ec4f6so55203181fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699397; x=1702304197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3j2KS0gi+TQKxkDP6iL7961UxDW9BTF2XTenr3SsKs=;
 b=Fok74VJGGqgNlh4r2Q1xmhAT6gLsBUObq5xR+zKQXU5xeJncPZxesojXKEh2eoc4EN
 qC/q7cXUK1F4RLDzZ/ioYrqMv+5eRQbzZIDsXLELvWOCdIpGWRQ+uhVQwR7/HfrtHxH1
 5RAtoPQhIaM0CjKXAu84BRBJfWv4lKyn+PPbsF0dxP/8ZzKP96Xioh39AOpJ5cjxKp+v
 Y7IHjT2Kwc23FjB8N9WPHjRLNnQAfC+Ez/cZJFBOa7OC4wmV4kSTDU7qKK1n5KPLqzXe
 B5HGNlkPDfoypN3ihwGjTHjM7YiZ2Vh+Bmq0dEb1pml1eAYUOc9g5DR4I/57Oqgn4BkH
 ESWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699397; x=1702304197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3j2KS0gi+TQKxkDP6iL7961UxDW9BTF2XTenr3SsKs=;
 b=jOioZr4H+rDSoXNi3Chbc959xKd+DxvxMFRvopDE3u64V/HhbcH8n/5S+qjMA1RK6r
 BzXbEJgMAv5GmtWgdt3p3RNRSeeoIWFaSb9g/RAG6XP9k4HrFRHOXJ8VuqrBhHVAZKln
 v/u0xsegL+RqX/FZrNwpFLN4O0nG3axsmzNlZo/xdZF9HwdArnA7MnhxHGUF26deBCgs
 xdh12nvCDKkPp6TNxt1fnwrXQ8P9T1LWOUdIVj0X3yNZ9ecsUilkqY6TeOm6tEV6pM5g
 y01m15lrqBwOLjNMsfly0pifbSbuOYatiX0oGfcqnm7sx9pWLdd3i1r+yhtegxtXxQqG
 U0Cg==
X-Gm-Message-State: AOJu0YzyJpxsOR9l3o/jPesOcdhwvI64PyqaOFadYLis3+2G9jrhzUGz
 dpTFkeSqZQJUll2hXCpTqEXRRA==
X-Google-Smtp-Source: AGHT+IHaX1+G4i2MHGUFU1uKjK7P9+tYQt3ynolw+mKE5HNt183VLmBxt8CMyqeuATitU4WX+RO4SA==
X-Received: by 2002:a2e:b009:0:b0:2ca:4b7:a933 with SMTP id
 y9-20020a2eb009000000b002ca04b7a933mr468155ljk.51.1701699397424; 
 Mon, 04 Dec 2023 06:16:37 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  4 Dec 2023 16:16:32 +0200
Message-ID: <170169936702.76859.18234919578150833329.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
References: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm: improve the documentation of connector
 hpd ops
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
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, quic_parellan@quicinc.com,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 13:13:58 -0700, Abhinav Kumar wrote:
> While making the changes in [1], it was noted that the documentation
> of the enable_hpd() and disable_hpd() does not make it clear that
> these ops should not try to do hpd state maintenance and should only
> attempt to enable/disable hpd related hardware for the connector.
> 
> The state management of these calls to make sure these calls are
> balanced is handled by the DRM core and we should keep it that way
> to minimize the overhead in the drivers which implement these ops.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm: improve the documentation of connector hpd ops
      commit: a5b2dcb96d6acb286459612a142371b0d74543bf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
