Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A785FCC3989
	for <lists+freedreno@lfdr.de>; Tue, 16 Dec 2025 15:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BD010E2DF;
	Tue, 16 Dec 2025 14:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lxbdZSZ3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE3A10E2DF
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 14:31:58 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so34101835e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Dec 2025 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765895516; x=1766500316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
 b=lxbdZSZ3GQNsi2tFSAOl+JirX90JHzsvUYxBy3gJus7o5W8Z2WdSaak1cj9IlB09TU
 iwXa1ZAYMz692yBD7u4fciJHvQdMT7i8gmU5Y/2Gq00ijN/bV6Xyq8OktdNZC1Vm58Yw
 OJGMzA+XdHidfaqT1Coh6hdFQbYj6Yy6B21ws4YhU6lx35GAmP8xI4kquI++nlzO+CGf
 VNxrB3TijjHLCShTtaJJPq9F8na5vDaEyEuP40yhNicwbx5qJ5fGjpuiBq+WweD+hJXd
 RxXOHOGehJL8Jkg6IQSfh/x9qj6ZjHZm/0ipVqQQksq10WuW4dMfAgVCpzeKgwInEm9X
 OcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765895516; x=1766500316;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vrvW6xI1XkjYJ7Zx47OyO1gNTKJ3KALebK0l5/GjGy0=;
 b=s84Stb9T249dUqklV8cMh1tNEllpWkIaMbgj7TI7EPunEokXNLwtdribdCbeQjXiQS
 HoWOUnSxybZYzfq2AHjUdWzRfrb2rCx7yTYED7Z2bpVCe45HGEmP72lZHJ3A5jj3Y+ac
 rXV1/hoRbvO812Ve+zcr8eC+/fy1+n3cwTgBg8Kw8PckIk4sB+a4htSygpQg6+ijuVBm
 iohuQy62/n8ghnDVJhRwdyYk3A3wpcNNAugibQl9dbKp67LCCvu2LRwBRwPdnNRZ4MYG
 UHtnPljgW1bY6r/GV32aoI325q9iDTHJLPh4KzSZ018wtJV086rIUtGjFLu/Wi/RUWB9
 3jNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcbomEtazMWcqvBbmdZB50i5QRz+2xcgVoh5dk1Vu4aHdgbV2R3xYKVyP3iaUAFJLSURQgXZ+vck0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0aBOLzYk6yD8eECMkfOgkH6WH7dyWLOvkL+RbADD09YrCmVK8
 NGdk2VcrG/sRKhwZzJDsSeEZBTMnQa7OwDr4HMc6XZ3HEuYnGzGxy13i
X-Gm-Gg: AY/fxX6hBRHcIYOSMWnQpVwxVvg+w36fhU3OTo181V3B8dgQT/fz4iZsRSeBv0zmiB5
 MrXaHEnIhi3asQP4Jx+qGhtVZaiRwtt+FlsY1xlkYkvsOgFT1gITgXluHDAVAtlR+bCWKvj+ipL
 1bIIAod5VC0SVBF88/cxME+LZEG9gs3Zh2EU8wlriDSwW9cD4NdTu8doDoFOYFEuV6BN4XbvADc
 TU29wT0GajCufVSTjKXg7Ny40/1oKX2ZliyRoL7iywGcgij8CMNPEKx3gUkYTYIPeOIR7XfYc4A
 zCjdCCZLhGJ4UHwVahRxUJEcMgakrd2HpsMoXK4ArefmQValuyPtq/9FGs77y0ER08vtZ/DXKf9
 mQAYXKZw1cbsxaYRCL5iF9GmWkWfe6n9b3kvQ5kYIepN2OpWzo2wClQRisr+XjMk63RKfc5MDaQ
 +S9Ykg+1l5FYfmMbXx90bGS+dQ4wC7AzhnvX8tf7A7VfwOc7D+rkbrSwIDcXep1OssvrPYO8iCq
 fcTkmr2YCcWjoUcpSQ=
X-Google-Smtp-Source: AGHT+IGzep9ECZOwaPNpiBb0/p/BCg7/qLnqLf0vDlNHlWftA8GOgxq/kseyAt169pupxPA5dddF1A==
X-Received: by 2002:a05:600c:35d4:b0:477:7b16:5fa6 with SMTP id
 5b1f17b1804b1-47a8f89c85dmr179474045e9.3.1765895516300; 
 Tue, 16 Dec 2025 06:31:56 -0800 (PST)
Received: from [192.168.1.3] (92.40.200.39.threembb.co.uk. [92.40.200.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4ef38bsm259154525e9.0.2025.12.16.06.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 06:31:55 -0800 (PST)
Message-ID: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Date: Tue, 16 Dec 2025 14:31:52 +0000
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Language: en-US
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15/12/2025 22:15, Dmitry Baryshkov wrote:
> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
> DP_LINK_BW_SET.

Thank you - made this change for v2.

>> +	/* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>> +	if (link_info->revision >= DP_DPCD_REV_14) {
> 
> No, eDP has separate versioning register. DP revision != eDP revision.

You're absolutely right, this was a mistake.
Does something like this seem reasonable for v2?

	if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
		u8 edp_rev;

		rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
		if (rc)
			return rc;

		if (edp_rev >= DP_EDP_14) {
			// parse the rates
			// ...
		}
	}
-- 
Best regards,
Dale

