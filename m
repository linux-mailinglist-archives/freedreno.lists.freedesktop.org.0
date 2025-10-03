Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E88BB6481
	for <lists+freedreno@lfdr.de>; Fri, 03 Oct 2025 11:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF77910E1E6;
	Fri,  3 Oct 2025 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aYCY8gWb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F2F10E1E6
 for <freedreno@lists.freedesktop.org>; Fri,  3 Oct 2025 09:01:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso12143475e9.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Oct 2025 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759482118; x=1760086918; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
 b=aYCY8gWb7SO4/g335LO4inQ3OPE9uFMr1c7Ebb+5jTeAclPhOS9xPqJN5rclKw4xEM
 zW72iD+QjfjaQcGOXNIBYCmwHG/Y7CT/mlta15GFMF9ZBD/Ptnzu0uglVHjh0euuBCvR
 TaFOJYHqhf7RvoEaBRQpWpb/FZIYP2lWWgzovcWMPRtr5OYtAIiNcLeMf3PITizvIqzD
 Lh3XzcTFys1MK1UJpPEDd3+GeClBTtzOSm9jE1+Py5Rlk2QWdEOJugfwnMTdRNGO2xh8
 0NSKzRJmhyHlr/JbtgtKb6qBg/hYtffgE72sS+2sWr0lUEl0Yq0GGlaKJlZRASK3LB6V
 gLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759482118; x=1760086918;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
 b=hlG3Q9htKeP2O2IFJ4P93BwBjeYSj1jxV86Sy+B5sEJyJpODRmTBSSVFxe05yI3DfI
 FHLboddwPiaNGs9l2yeDOgnal3yH47g1lnJ61pTsRTYsgdUL0+TvuQDtsGTR3oCVWBk9
 P1MRFHxV++T6mI2/NmwNR+psC/GCqVveF0OUxAOrLJV2z7gYCUD9NquIs+u+Rt2I+m1d
 43n0CLhxk/ttn96KJeGf5LRonL7+xxqq4C5KcZXhOxA8BmEfCIDcqpINIbi6B37B9W4J
 ZG0h+Kz/kxbmw9XtDqs0thY9U2RqpCmcMQENybYvVfK68v5zW2Ut8rrERhKWQyXaRqgh
 9JAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVsF8vI5J6Tjp/O8G2KBF0QXr1PaicFgIX70smh4F4pT7cM6Tyz5h04YtzoUshCmfD5nlwgjqoerA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsE4b1Qa7isWNxzNVHUgQVS/q9XDbcDmcS6gLpwbnYKSDdofyg
 8V7cKx5w9L53zl17dqa5M3n474NmMkHsLGAx51AgzqXFyE225sT/vOTlwvS3WlwNxBg=
X-Gm-Gg: ASbGncsd5Fe6uYZWEC9EmBLqyweJ2VzuKxMgQK8uTZ9oQvvk3xwGKeOp8+W2jaKzymB
 IccZZdXWp8xO5J6AQRhu0RiOo4cj7g3h2a4784aaBHZlDTtplKv9crqR1VeBGvQ+hHD6wH5vQUH
 xbckO+kWkpwKJz+dYqDG5JlqzYG2MogtRfJ1f+9D9yovMi0Mwas5dqZXg0RskTXRQHLjj8hrTDO
 eKiaxjWe7tN7WsaKCj9N1Mzhs64G6RVRKgmjQl4r+Ck51NRavzzE3oQPu8/m7CPWsNZ1aKsczZK
 96SQagVnyUoya9k+RQNNt5BgbKquDlf9kS+p04wyeLce8E8xQsXpCj2zoPljhSls7RmR1z32f5u
 KZLWGP0oQ+asagRp7TBN/FiOh7ElixvMpFZzbpJiy/JG49Voj5U9Aa3iZMT+BWPXVvrX/WKCQTv
 3w6LKx6uDTqfn54NhyBV1tX0tTJqc=
X-Google-Smtp-Source: AGHT+IFXXFYBejNEk62TTVbsZCkjTfoWLoHDUC8jbliGeXsvvT//1ANw01aVm2hkqA2pgnjHgXrrcw==
X-Received: by 2002:a05:600c:1f8f:b0:46e:4922:6855 with SMTP id
 5b1f17b1804b1-46e71111c0cmr13814655e9.3.1759482117724; 
 Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1516:b5be:def8:9a0b?
 ([2a01:e0a:3d9:2080:1516:b5be:def8:9a0b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e72362344sm21796015e9.15.2025.10.03.02.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Message-ID: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
Date: Fri, 3 Oct 2025 11:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/3/25 03:17, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

So dim complains you didn't review with the right address...

dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting

I guess it expects Dmitry Baryshkov <lumag@kernel.org>

Neil
