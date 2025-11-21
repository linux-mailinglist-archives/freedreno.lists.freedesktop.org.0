Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47BC7BE4D
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 23:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490010E912;
	Fri, 21 Nov 2025 22:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqiA6n6k";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnDPLtU3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220410E914
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALMXEh12831653
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Lt2VlA60KpZ+lORVZ7muV8XL
 3Uazs/JmPydxQ41bnJg=; b=RqiA6n6kdmB3nZW7u8TogQq024jj38eCRS2zanl+
 3VTpqQEEVBn1aX7RaY2PTqhIXQOXXAY8vhCUzOAjQkxoUxq72sgmnPR7/dna8PSM
 C4eJCFBn0gG382CWfI1MA4RpX32m5sCWHt6y2LMuqhDqqzkU8pqMJ64XeiAeb9YV
 Vl7QPa7C48PoTKKx2IdX2r3G4nnCu1aAf1g6ihh054EOqlNwNrkMucYx2pqX4ZP4
 aGz49iGg289NkLszGvSEWDxGc9lB7AWzVn60XupuVKtfwwVZCVs0XuIB2u3n//18
 2MCjhux1tTTDxh0WY51n7MmuD01tVeROgK4/cOeRGdKe9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq34q1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2f0be2cf0so945427185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763765041; x=1764369841;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lt2VlA60KpZ+lORVZ7muV8XL3Uazs/JmPydxQ41bnJg=;
 b=MnDPLtU3mgG0c8yLyfJAX+M6p5R3McA7g4kB0l/9Won0H5+bnt3OwQupXZMhuXAlO5
 YkrvjJBcw8NLD6gDlW9k1XhAPfWXy6q7KvvGF5zoXm23VtmWyqVj/9V6IGuxPZijSgjQ
 WRnM+OpKspuYS/xLDTen250lOPqLQWT/aK6Z67+w1tzl6pUinOBAlbuvgMYrPEeQh38g
 9wSD/QEfU5oQUb92RnVF0KvQM3irDMUc+8351ASkCQekJfE5BMVpN5j1CGBFoYGJDZR7
 eXc7X4Efm1RrYYmdl3PImSDOxHstbFKYal3MVg/5lIFrNZVwX9miRZRXfPVWcxi83e8S
 XDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763765041; x=1764369841;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lt2VlA60KpZ+lORVZ7muV8XL3Uazs/JmPydxQ41bnJg=;
 b=cCDf+CP1TvsvvTpNAEFoOVITa0mj7GG72s/ZDyocHuGqRpeCZZx04bBuO74BtjFjGb
 i1I8pk1t2+ZQS/JzSDB/2qe1uIfFjUDXiCMNkL+Bcf4JR8lSNrgfCLtIAGor1ods7JYd
 BslO8ZKHyhsSe1oiZzdjbgYwRTIpCTHu8AcJTSVNRczvjHcP5Xx8aibIhf+E73b7l8G6
 ucnrBzQa+z7LZjb82cU8IX9slPET5QYhC/SxZJY1ySrYnnxX3DtbOQSPl0HyT8m3LWte
 thmixEpU4IaCv2wImuQFUW/1omE6RINFIvuB9tKIX5AcxOzGxJDJlS8kjXfdUonQ7qwy
 SAhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLAq0Jhn3xF/fVnXDtVDP+HivlmC5lBjmG97C6UhdqAFL4J89R/bF7RJCcbU68UNy8OfSCkdkXBtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaOUBX4IvJLcsyAr+2mMutTMGq8crmaHu8o3/DvnZJZ2WHDKrO
 52zAOxvYW470cUs1N7BQpbW5KKsLHiqXTrfQDYDaqD8PdWW+D2MO2Y5RiGIvdoLLl60BbAR0ZsZ
 bMwEYekrF7VS04okzG+f4Z2K7PmyaWsdf2xkkPpAZqeFjoQ8Bgn7W0oonj0t9XI45DHvKOUg=
X-Gm-Gg: ASbGncuvXTGlQaAH/bvAxWj8Qb9Mlv0aVqf7/tFk63RAxPdQYWYsKOvZWfd4fcrzZ6h
 OCQf1eJWnkLeNNLP0+I6ceSjwTKVQWkKD1ISNOLR2UirhxG7uIc054kIr0gZa+/u43PkARgDDPG
 tCoSHVJQHK/Edpo7V8Jmf8f9jMacjHuUl/jJSZKq65fD7H2YERcO8gKS2nBpuvFZmEwNgkNtauc
 olZCD1IHwAuHgj1rFZHxOsETzHelkPlR9sBKbQmxGjNYPtt6RUF7kiOxjaP5u+asd0/QdZ5EIEx
 ckk7GXm82tDMkkvL0V/XD3PTihyl/GkdGjPbEYBArW3YxA+nv4WYkWF4nP38YtCWjtywVIjuMwO
 g/mOF/o4R73nzgv7F0YycBpS9w050L0L0szffWfQ4ribM6o3+yU0sGqpxFIo408r3QAzxZ5O3HA
 wQyaWprAyjzM2RYvXMPdS313c=
X-Received: by 2002:a05:620a:472a:b0:8b2:f371:55fd with SMTP id
 af79cd13be357-8b33d49c4aamr476406085a.73.1763765040877; 
 Fri, 21 Nov 2025 14:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0ofJpRILhI6bT7upBiowbl4/wWW7HOk62pS6i/7dX+IWtsIMnQzCq7R/HNDZEkEuBvwi2sA==
X-Received: by 2002:a05:620a:472a:b0:8b2:f371:55fd with SMTP id
 af79cd13be357-8b33d49c4aamr476404185a.73.1763765040435; 
 Fri, 21 Nov 2025 14:44:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6b59ef2sm13345351fa.16.2025.11.21.14.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:43:58 -0800 (PST)
Date: Sat, 22 Nov 2025 00:43:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
Message-ID: <53wibjsozkxtgo3nfvdf7dmxpwexgv2wveazc5ql2qlqhxeuyv@ypigdjopj4yp>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-GUID: e_ZVkfYoaTHyshi21_cNM-qc6rp3EnVf
X-Proofpoint-ORIG-GUID: e_ZVkfYoaTHyshi21_cNM-qc6rp3EnVf
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=6920eb31 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Mg129bpxoquNgMNKXTsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX56ta2mgGJij6
 MzQjS0IOwRLjZ3MGD/5lP8WEYhPtyKue7i+DyXKBtd5y62pGnGJ7x7029E3lxNlA97urvs3/eds
 2hRS77No0G92/7cCqHBUzy3TFyAJw85sWS2q7cY/amvXpnBHn+NqWQZUTKA0hpzIDtMGLoZMlQW
 y+gsuSgwi+7wm1YsvubTMxpTC1BZl7QYGNeSAn7zPw9P4V1sOhg8iXSOFd0koYzJiClsSs5rg4U
 IaL+R/7iSzgoyr3jSkIkMm8xJx2b5yhwXUu772T2F+2vrlZwvy2TxtO/ExpwIK5ZGZxIfhnWe/a
 8KzgzYZSmT7Pc5qor4zSG2ov4/5S2B9XdNwmCpTiH+WY9Ts0PggI0wZokBvnigfE5iapAKl8pKz
 5s5CSXQx2kVwgKDlFXk5jG8Z438drg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210174
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

On Sat, Nov 22, 2025 at 03:22:15AM +0530, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
