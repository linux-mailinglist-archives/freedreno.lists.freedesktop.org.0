Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD5BF14E3
	for <lists+freedreno@lfdr.de>; Mon, 20 Oct 2025 14:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5491310E323;
	Mon, 20 Oct 2025 12:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJfEo0Cf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DB610E216
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 16:16:07 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-7847ee5f59dso16440387b3.2
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760890566; x=1761495366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
 b=EJfEo0Cf8+DN14jjbheL8tRhuW70lHMNn+k5/+m/EIQA+dAA5F0ku3iCb5FfzlR4MI
 7rvinNF335F8fK+NuBWET//3vTA2UruPUJjzJuNHdjMIxkUifb4IBACsWmb8Ne+0sbcM
 QmiOSLdMb8vUe+L1YP77uyt3DHoOKgwmaD4StuAwOKo/v3yvfAZV7KmdCA+a29HnB1v2
 7/XFJxxYQsi5KrNrHJGs6pt3QsR7VuquQyVMyOxHXNTJQ2Tlvq3GgGNzWrluyP0jHHdd
 VJumLwsDwd48yil7gQaAn4gLB4wXsLINjB6l4aUMHSvcf3qY397Q894eSBTDIok+EBju
 9vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760890566; x=1761495366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w65OdgmpV8I1cxj2sfq4rK12q9mD/l6u6jCluPLlwTY=;
 b=jaywr+pKnMNr3IrulcNqiHCrbC4PZhLnRdLuXwrcEuYmx2MosymlP+RgQl6l/KEMco
 CuhC/L7unVrIQyWzigjfmDOpE5yZ+REOk+73vEpkwvAgoZaIushXUun1iNDExKjsRORv
 IKSGpqpy5H78y/L9X4A9Y2IOVtPpZcWVFhJo1KYjrTpYYBRL4wYjKZzQJRBHv5E+9t8E
 f1VPkWZxNeVPsG+kdvbfN1CHCU3mTLGwJUJE+pEJQrQkh775y+ACRqFtoIQsuR2htJ0E
 Rue5zDxZ8o6Mg5ou6UkJ1x1VoYBKobTdYALHkC3H/P5WG1b564h6O0EY1gL5N6OXX/+O
 qZQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAlVneENgdLa5Usic7LgC8L82RIp4cE9AT31Uu33SogYWexfq+LgpIQh7+QtVWH12M0R3mW5oM6KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5lRLIg5fJM0yBxxGAcP1k0BwaKAed/jQyS6Lcd86LcV8qYaqR
 N9U/SM34IG2yxKtUpKjYeCIBtyD9bVR0G4SPvAwfDv/gHh2jo5iJvvIw
X-Gm-Gg: ASbGncu7bNX5wZfJrBmPsHxZkQeGRMvX/9hC0DXByScGFM0hxqTUkSTh4QzmV/jh1IW
 Hq0q2LtpXo3uowGO1GVsqLOWFmNt8+HlS98NPPywyjlhaGG4UZSDnCvhAhBJqK7oaoClpp21GIW
 0vjumzqj0efs/f31xRUweB5CR0Jza8wwh7hSvJZrBm5KO2hofsgA5FCYZRikj/4bZiB23FrSQ+Q
 IbWPiSNgO+k9k3X2ZKWQTMNo21AaLKRSaR6XvBMd0FUMdiWfyJg565J9t+hY4bwLK3gIC5Jn2bJ
 ltJCDQzB4/1EhMJVC5hkKLr0V3e0GCAhCABntABw0BPYBseU+0TkmlQ9lZTmkyTafJUQomEvPgA
 dJTVSw/1xbXICjkUwkbHe+/WniAIbdtsPlX/NZ2hET/k+EWPSsP46Qv62GEYXg0VgELg1In9Dvk
 XyIRMWF5DDrkNriD7xKCFXLfrMWYJX5vb48iVeZhYUDFfxBqaG3JymwnMkOiM=
X-Google-Smtp-Source: AGHT+IElWfzAepNqK3LlpQymTFB+dnzq6dId0s4n8cc9tbggmQJHdM08XYTf6C3f7CI5MrGaIVI7tg==
X-Received: by 2002:a05:690e:168c:b0:63c:f5a6:f30f with SMTP id
 956f58d0204a3-63e1626157bmr8254979d50.57.1760890566174; 
 Sun, 19 Oct 2025 09:16:06 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net.
 [104.48.214.220]) by smtp.gmail.com with UTF8SMTPSA id
 956f58d0204a3-63e266bc09csm1738354d50.11.2025.10.19.09.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 09:16:05 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: devnull+federico.izzo.pro@kernel.org
Cc: abhinav.kumar@linux.dev, agx@sigxcpu.org, airlied@gmail.com, david@ixit.cz,
 dri-devel@lists.freedesktop.org, federico@izzo.pro,
 freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, marijn.suijten@somainline.org, nicola@corna.info,
 phone-devel@vger.kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 simona@ffwll.ch, ~postmarketos/upstreaming@lists.sr.ht,
 Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Date: Sun, 19 Oct 2025 11:15:59 -0500
Message-ID: <20251019161559.6731-1-threeway@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Oct 2025 12:46:39 +0000
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

Hi Federico,

With this patch applied this also works on the Thinkpad X13s (SC8280XP), thank
you for this, I know a lot of end users have been asking about this for quite a
long time, so nice to see that we might finally get it.

Tested-by: Steev Klimaszewski <threeway@gmail.com>

-- steev
