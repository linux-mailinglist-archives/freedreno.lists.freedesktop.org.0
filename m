Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB13A9BEF2
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 08:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898A810E892;
	Fri, 25 Apr 2025 06:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WHmwDjVS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486D410E893
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 06:53:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5e8be1c6ff8so3274967a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745564021; x=1746168821; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
 b=WHmwDjVSXHxWcWE1F2fUM2k40VI6363HwJUDvIpAOql87d6um1UX1gDJuSF3JToDWp
 2SG55EJtg8O/eFfokVa2Ki4OuCGkahw5WXkL/IY3rBHyj7ZYhO7ug8GZDl1fs180Ahd9
 641cZ5r+lMDHeJOjefAxm3bmeNYzx3l48M8XZz4zPrHaaqdvFx3TwLtdT+9jsN+gDJR5
 xDslGafL8drnCnO+Cb/bxpHIp6wE7YTZE3aL9Cq16+s7cduUkQe4s2H/k5bfICmJgaVV
 Lt5wMKwG/Way/NmCmja8F78+0PCJfHB45YSozNgijqFKIbidpjaP54nXfDGHp0w8KoTl
 YNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745564021; x=1746168821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNsUXqANAHwqGKnEjqoHbtxkzle5D9NAnbyrathgw4Y=;
 b=rHVDThwlP4E8uq8vblbxcutRavpAST8hxsYTxq72iFHPcy5b6PhVXN0ssittmRL1Sl
 Db4lyWjuSn8RXvPdqZC33H97LPGtv2BgFotdi/sSgWpPZ2Ka8IZSpiBLR8teeDEyUHRz
 BGJ26ijM94fsgrcqgQpTBqsJL8s6vk0Ja7Wfo6dOz+InCyHRzQzIRJucJh1smlJoLXok
 11xYVgtSn/emIPQYvvFEeu5Yc2DQ5hU46xVPM7t8Gn3kZIbYKvEjPUs0DV8x9CV4fM6g
 /tf3WIOX1DVandvVrvjCfA+NIM97zdVbIgxTJ2D+2yQA4NZDCFhF+6qZ5DTFD4+TaUwR
 gojA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzetzAaw2ugP0xSVvbUW/jprXhI92P8p6981mT75x1YUB1Cs9pueqBy9eBmHnf+KqAolFSh4ig1mE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxybr2drEsHJaX0PZnyy4QeFLukmK3yjN2+4U6W9I1i8jJLFGUH
 /mxdVYxIoAfvKA1eiTD/WCz4RkJV0XNHUC91tpQBYxq9wMQzFjcZt88r0S+dOCE=
X-Gm-Gg: ASbGncttjFyH1UKg6wom0YCT7QnD5QIolXaF4rHi57BRqTZnxoFlqFfOnm3yvekKHfy
 izoTpCMI2UNzHcl2PQ7U5HEEYb/9873Mm22Zz+aS5XELPCYTfhfVfO5tX6zOyLZmdSflmlgNAZk
 Sxzqrt1tT64ZNYtUuCM8zqZnEP6TBvmqXuGuEGqkNg0SErS8GnaBrTA6kUDsTvJ5A0AVYQE0CO6
 1pkkwo3leHcQ5DcYVMUfWFOyvqaCwkP4J+i1HHB4Ws1K2ShG8wnGPyS23NoAeauo5Ahm6dSIeg6
 sIvKgO1+RbOsflxZv0aVCbWYtHl3owRHiopkZg==
X-Google-Smtp-Source: AGHT+IGH00KXAycAkV9YoM6vqabPYd7he5htUrIMPdynMtalpRs9NoW+Upt9XSoJNqYWkG7Pm5b77w==
X-Received: by 2002:a17:906:c110:b0:aca:a688:fb13 with SMTP id
 a640c23a62f3a-ace71178f01mr114937366b.36.1745564020787; 
 Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf8c9bsm84603966b.101.2025.04.24.23.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 23:53:40 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:38 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <aAsxcrWyLeMB/Tdv@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
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

On 25-04-17 04:10:33, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
