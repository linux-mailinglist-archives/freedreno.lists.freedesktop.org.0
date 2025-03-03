Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A08A4B82D
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 08:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8A89FA5;
	Mon,  3 Mar 2025 07:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xl+o/m8W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF0689FA5
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 07:14:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso776902566b.2
 for <freedreno@lists.freedesktop.org>; Sun, 02 Mar 2025 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740986050; x=1741590850; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=xl+o/m8WCJAyEuY0WHQm4wXgcuYwlObsf2Nh+yFplSyPMvswnCYtjtL/hrbhy5UMDd
 Rghg0kG7oZT8aEFO3jUcUUE9H0nqkf95ihLreXKvJpj8zngHEyVylSOo/h8r5vPPXNzf
 /PryuFGxxLv9RQam5zkuZ1Cl1k0C1iDnxmA3h30AVxYfr+Zu0nX58kUtkOSKca5BWpq+
 Ju3W6qts6rS5BO+KAJYXfKXqjJpxmr3AMLBxeuz7buBf/TVmfk9Z9TesUQdnPbQ3Ut1z
 zbO/LDAgZ8rzL8Ab5k+E5LA8bTRmvDHg6/mL2+mdw4awxBwdqe97k5edgluiz74bjMwS
 D86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740986050; x=1741590850;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8RROaO6yARYWUmuYiLttBRg0vezrYJsF0zsoMASJ+Y0=;
 b=Nfa7ohcXRtlwanEJJB43Zz2DmG5ixXEWhzWMb+Ys62F86GTf0Ri7NVkz7DDbry0t84
 Yc/RJ1Vtvcnw6SUq/WamHnhpln3tcw29LUmxs8BJ0OrzYPN/t3XlSd2hnlnqW+0I1LaQ
 48XIxI+veLUWr1bragzYGR33410maVpq07jGwc43tJbzWxuCjtr5Ouob1YI/u8H3C+cB
 mMj5aUizwvsoaxNh1aVToOQ4MwIL7ncnX7+Opz2S/06KK9d09U1Ja+ti4WZyBBxZ9dNR
 wl7GnrkiGeIhryLdaQMH5Gpn3Ibo6/8E+EcJ/ZnC61wNq5J38x/Et4K0q3x5dZIZ1GHY
 tXLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Its84Ar3yq6A1bK/eEVUez2lRsCTV/aez8HTAUsyBW4uczKKiKXNxsNdHCM40YDgYQa1+3ioUSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYGvPqdSd0tIjFPYmowuCly7iqavxFLgzFEEwfCUmIEUkEXOIk
 F8hIlwiLsXroR+itwY8qyPiWSFse1u68fIyJ/iSjZHqprCvZm/nPyg3QLnjfpkrzkyetgqiPMLV
 7
X-Gm-Gg: ASbGncvfoGfWd3EiGWTyMeE0YALskArbZqOos3zt+VVqs9v+htbbtUk6KsNQtop4S8L
 eeX1fa9WgEu2QkAozDpueI2JsfBloMhjxFLNRESPDmw4vWr7V8s1UBOaP0CH3Bm64PUx/9fHcB1
 lfm4MbCl8DAN31UWf1ccBwx2lT8Kqicmex91kbsn514HzDRpU3OQHkO8K8JDn8UQacMAWI6wrLc
 uD7CeSJshxr07Fj/dlvr9cU8UuN3Wau+Lj/jPRNMN0B/5lydYpW0ocustaNeIIfT4Lt6PAr4PwU
 nCylJTUTzqU17Ngky0ektDYuNY6eZA+wRv16eRJHE3NcbA8g9Q==
X-Google-Smtp-Source: AGHT+IEny668UimPZ3R6dx4axvviTs297S1IJ5VK/kkx2SxfpDGI4c5Rl/7By42IdqNYV74cMm4sFA==
X-Received: by 2002:a17:907:980e:b0:ab7:b250:aaa with SMTP id
 a640c23a62f3a-abf2682f996mr1554838466b.54.1740986050266; 
 Sun, 02 Mar 2025 23:14:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1dd6fd870sm60633966b.70.2025.03.02.23.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 23:14:09 -0800 (PST)
Date: Mon, 3 Mar 2025 10:14:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
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

On Mon, Mar 03, 2025 at 01:01:40AM +0200, Dmitry Baryshkov wrote:
> On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 11 Apr 2023 18:24:24 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > 
> > Thus avoid the risk for undefined behaviour by removing extra
> > initialisations for the variable “c” (also because it was already
> > reassigned with the same value behind this pointer check).

There is no undefined behavior here.

> > 
> > This issue was detected by using the Coccinelle software.
> 
> Please don't send resends and/or new iterations in response to your
> previous patchsets. Otherwise they have a pretty high chance to be
> ignored by the maintainers. Use a fresh git-send-email command to send
> new patchset.
> 
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

Remove the Fixes tag.  This patch is fine as a clean up.

> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

regards,
dan carpenter

