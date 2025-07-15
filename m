Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64EB0698B
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 00:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785E10E70F;
	Tue, 15 Jul 2025 22:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FrmUc7SK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6732D10E6E0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:16 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-73e5792cb9dso564497a34.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620355; x=1753225155; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnsFPQQX9fMc8mZnHVVURxEZg5Aj2fFc9fMGBOeMT1w=;
 b=FrmUc7SK2AMJSfeHKmG4z/PDcGCY2wUwOAPucWWf8tghstUbaj8TE3CjnBnzwP87Hv
 Yb87G/dRd+16iy5I8ZykZOagavsRYs9DaQcBdW5kn3Sw5Ulsdt+alyBfTX90ZRXyuU5u
 y+FjN5Q6Kqrbqw6e1Kms460sjXBlctZjju4vfGrh8lTsIanCeIQiwgk7VYjL3c2Yolcz
 sQj1Qs9eIhqsSCDs0CMj2D2jO0oAuQ7regYWlnDO9uXRGsSsKE1YfM4VfiubXXe5i53Y
 AgzxqIOaQOt+nP0Gtx6XfXHnIzZssonqLe3jflucXOKx9FM84YuDMiq3gg4hgWMQ4uAa
 CD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620355; x=1753225155;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnsFPQQX9fMc8mZnHVVURxEZg5Aj2fFc9fMGBOeMT1w=;
 b=iXicxwogwaEaYGKGzyR98k4wO6n0frampUYAh9DTFZz9VDJbOxuXU0ecmZ74YlU0Rm
 Pkj7v/3qpTaX6nRyg4XK+6odrmdu49fO8b0wqSGIPz00bpkRBrBUSVZkfKyRfiFgPRNg
 LcfcAUDeL1Q0rWZDvxch9ME6YdrXRieaCGdTJPrPP9vsWNNVmarV9P/6n5dYGAbLySnw
 RxwI5GkgBIGptx2H94e0wHm1ixX72XLVdjQCZkNeZyZ3n3LPpzXNNmoSWh2GPG33IXbb
 wpbAfAl66czHHUXq8/fspblnMqSymBcw2MZRLAVENudSwUcZiGbdnZwQruMIAjahb+bS
 I5gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC658H8bUIptjAYNE6lmDsTqi2VqqMTDtN47GSm73Z41tKp7w5WwOnXFbdHzrzS/bdbgpXfgLVewU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3nHi4Z/NkGblPo0QQTNOn+/HFZOtW+srfgDNNc93zPNLJnm5c
 lyVEL8DTFu/DjrxuOnilDvoo0yxIqe12k2A0CIliVu2OSBmEtJ0gTd6u1OtTTotoSiw=
X-Gm-Gg: ASbGnct6Cgl2yHmTSRsfVKqhM1alHdqN7O0hl3ux9GzJS9ASTxjV9BgMCoil6piCzL6
 6MMdDXwHG9LAT7Ausr6cG+mh4hMhIHLM7Ops9l6p3X4Y/aBNs1TkGeVnyKlhErN4Pg6aCFnBjIF
 9F9K10Qpw7czIlxaKMy6+/lKeiNgfbUQLJZyaT/v4to/feKKftY4VHSNnjPfsU5RjEU2MRVcI9p
 0vVIq493NXvooF2nppJRPEi24IUpNKkssFff9lEDFr6iZ6nY95USeCfjAOLc/QSS9ksKJBTw56R
 Naop4DMx6F68/mmSrG21EHxUOu15QBELQkHn40pU1i1XCevRXmeXbvYPFJy+FtqG7xvEOanilXR
 +TAT/xW6s2ib4tMpYKpkfmtEcJApqtG5Lsub0ILk=
X-Google-Smtp-Source: AGHT+IH0Pa4EbTgpgoFrZOlgckCS3peshir9288PbWdkOLJnnQdwMW9LC5JMwO//cfY2PLCk3mbHRA==
X-Received: by 2002:a05:6830:8209:b0:73a:6904:1b46 with SMTP id
 46e09a7af769-73e64a01712mr1097518a34.8.1752620355684; 
 Tue, 15 Jul 2025 15:59:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2ff1173040asm2947393fac.46.2025.07.15.15.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:13 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: bail out late_init_minor() if it is not a GPU
 device
Message-ID: <6174f797-e64b-41d7-becb-ebe7575871a8@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Dmitry Baryshkov,

This is a semi-automatic email about new static checker warnings.

Commit 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is
not a GPU device") from Jul 5, 2025, leads to the following Smatch
complaint:

    drivers/gpu/drm/msm/msm_debugfs.c:332 late_init_minor()
    warn: variable dereferenced before check 'minor' (see line 328)

drivers/gpu/drm/msm/msm_debugfs.c
   327	{
   328		struct drm_device *dev = minor->dev;
                                         ^^^^^^^
The patch adds a dereference

   329		struct msm_drm_private *priv = dev->dev_private;
   330		int ret;
   331	
   332		if (!minor)
                    ^^^^^^
But the older code assumes the minor can be NULL

   333			return 0;
   334	

regards,
dan carpenter
