Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC792CD5568
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C398910E592;
	Mon, 22 Dec 2025 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJBtXAtm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKz8a0Mt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDF010E58A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:35:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM5gE2b2189759
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=; b=DJBtXAtmvN/Uwq7H
 edFOJ+QxnwT7xBkk2XCUM6s/aJCN5MzweckM/hXYniqxIDVBwvfemLYY/ZFwill9
 Bcsu9rhnXCxaLpu2s7+tQZgkoU/EtA49/nh1l/HjlCyMptSgZEWhq7OtOJw3YILI
 o5W/YzbuOLdh0fO/0jpgrSl23QoocZDEH/tYTh47vhYEJrs8HfQhBebRcbrwmXxS
 d9mAn7LgHFPrDQT7pJiGSePCikcNsxYnpRyv5MsxDB+DmQ1Ed+9EdEtEGTjKE38s
 S0o0sqRxzVilbZOpJDNpzDPo6c8en+yZP5qK5wPdBsGb4OflDMwmWhf2IDDhQNsN
 llUmBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8pna-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:35:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88882c9b4d0so13248626d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766396102; x=1767000902;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=;
 b=XKz8a0MtSl15/Sf+Xxq0MsSdt7j39AfpWhlrBct5odmuHN0UVl4/eSTXnUYvSAzC1d
 AADKjenO/GO7Rpel9vlKuSK4GR023VWA/MZu/AH+ypZqQ1hcTrF4NltEnq2gtcCBYosn
 8+6/yy/kVeA5egFuxoKcZuBkfINeHjc2RIZAesanW6PsvYEhDDUcw0MCqY5yiouebPCf
 57T60w074y0WGAqTAB8F1qX/Ig0cT5lHoFfNeuvmQKPTzzCFSjYnj+a1EUHx+SFxKw4/
 okN7HzugvnC66oggsI+BJkWo13V9AFMqHEWvpp+9odbufJJdGvYW+nRx4e5du2GbsdDW
 PY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766396102; x=1767000902;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B3plZt5bte+qkiCj2pBEELaulJxcDl6ek425Uqlkc9k=;
 b=cwpVe4PrJu+Pe5L0+Yk/hZM1QPmy3sN+8NtmH2Dqo6lwopEBY6CMjXN3o3YmJXgd3D
 W/zCnF+Os99dfSuFu/+kKX4z5U5L1xxaPQG9Hd6Ai+ImvBHh5UoFV3Jqbvh9EgBoraAl
 KpeCrlPZYv0aY/zLftve5wIrbtVN8tVtDV1kOKLKxj0+DggDbN7Y84W9RmGhIQXnLYFU
 PnsgywbCsQe2dDJWrS9u173hGmnJAt08rOgRZTTVQcZ+PqOcYde8o+l0Wdy1pHJUTsOd
 osA7SKA09tjN8/27Q7zDhdyz2JSVu5abbKdhgbRh4RM6PvagMKqkKQwJxJchzpSbztz4
 1rzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZBJo7zzmug/r9WwSKvvMRDAm5R8Col3zw37iMDCO89nfoXVcaNBxiZh5Gc9qksb5IhRzMaxd5X0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+DvdjCj62nKlafIdIgpULgzNC4kJ/COuj75iaOlDndHYmscXP
 PG0gISmV4/Byrfpy347wJlU6X8z0BONOoTiHp1XZTDeRyAi4RgmPb6C1jpfb/FVVtGSqG4nYK4r
 IxKnevCGfD1ZaQPpAuA08Y3HvF00DbeHbb1pG/XJMpkbIM8kMq7C+GxrObEaBUrNDm6IJKYU=
X-Gm-Gg: AY/fxX7uGnSkaa311J9HJiW28L9gPizDnaRvn8LwhBML93cjbcmXEw9v7sM+yw7ZsE0
 ElWiya/TqtD0QAOFxcxdurGeIMgE3LgYLgCB+ipEf/sKFzMo3XhhJ6Vcskokypf4fvk+4ic5lsh
 AJzswcMcJl6zw/JPNg2ZQsjl0Q64WIZJj2ITk6hp7GzXW53WhsnAQ7XYrdq38nV9q8qY8jj0x+a
 C+tT8zq1r7xuDrXxhNfUasoPy24hQgrzYJVnUCQkbeoEJrOL1SsYEWzEJy+dbtDxJKdMMPnszlg
 C5cFuz+pp1s880rEM9NlIWZRiSEqXHe8jCYEDl6EpmJPuFDHpd7n8R6AL1T12Q0EqpcJW4DSm4C
 qZLQh8UqMQDWa11q7fqk4zmVPqELCytzrpeAQTBCsn1eZtkVO2qJJOvHtrWD6nt85OA==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id
 d75a77b69052e-4f4abdb158cmr107153521cf.6.1766396101909; 
 Mon, 22 Dec 2025 01:35:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC2cDet4JWSod54Bi6KxdIeJLQpbOWy6ZlVkj/EU4DXRP19VUVGfAQMc4AB0Mtr3t8FOTyMw==
X-Received: by 2002:ac8:58ce:0:b0:4ee:1c71:71e1 with SMTP id
 d75a77b69052e-4f4abdb158cmr107153421cf.6.1766396101507; 
 Mon, 22 Dec 2025 01:35:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53b21sm9857989a12.5.2025.12.22.01.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:35:01 -0800 (PST)
Message-ID: <3e42724f-8522-4426-b1c3-133d6f1d927b@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
 <20251219184638.1813181-3-rdunlap@infradead.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219184638.1813181-3-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=694910c6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=tHX55RXggAFrrhuCNvsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: j193BARLZfTPvihnLKW8qh4JFQQlHPqo
X-Proofpoint-GUID: j193BARLZfTPvihnLKW8qh4JFQQlHPqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NiBTYWx0ZWRfX5m4fHmVKeWZC
 ZGvxnWwnlRwQF9i1ZLoYtkwVwfFxcVnIGZWXDfGSx1SFDq7zhhkv8rm5Vic9Qw51W5ntv00VnAB
 gJam0y7Z/8ztdZsN6WkB2eGZOFZZD6fuvQQ/N2bBOzBU5D1GS+WNWXZf87OPYlU3mSCBxJz8Pgf
 0bINs6MyCo1mE9cKIrfIcy7yj3pqDdBPDjRIWbbqmGJZhFy8MC5lyYOM++OOr0GCToYYrc128Ce
 TuBVL0WKwucPPVlF2rjJD2IHt/se1uDriVhH/325Yg/zyaGqL3O/Zt1lTvHQp4RYm/PQSKbf7UK
 Sqk3tEiv2jJzLgtV2gjb0lidM9oF0h+irUIrSF9y1vauK2Ntn/mG93uRDBSZNeRcxYodmmcJVRU
 X9vr25dYuLRnRSchG3WDeFCIc529evU+g6wTqs0MK19rIUBlLXlBmtkPNuWThSBWO33+bj9a4jX
 5KF7Fl4W5EjTlrOrs3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220086
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

On 12/19/25 7:46 PM, Randy Dunlap wrote:
> Correct and add kernel-doc comments to eliminate all warnings:
> 
> Warning: ../drivers/gpu/drm/msm/dp/dp_debug.h:31 expecting prototype for
>  msm_dp_debug_get(). Prototype was for msm_dp_debug_init() instead
> Warning: ../drivers/gpu/drm/msm/dp/dp_drm.c:24 function parameter
>  'connector' not described in 'msm_dp_bridge_detect'
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:90 expecting prototype for
>  mdss_dp_test_bit_depth_to_bpp(). Prototype was for
>  msm_dp_link_bit_depth_to_bpp() instead
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
>  'aux' not described in 'msm_dp_link_get'
> Warning: ../drivers/gpu/drm/msm/dp/dp_link.h:126 function parameter
>  'dev' not described in 'msm_dp_link_get'
> Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:70 function parameter
>  'bw_code' not described in 'is_link_rate_valid'
> Warning: ../drivers/gpu/drm/msm/dp/dp_panel.h:84 expecting prototype for
>  msm_dp_link_is_lane_count_valid(). Prototype was for
>  is_lane_count_valid() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

[...]

>  /**
> - * msm_dp_debug_get() - configure and get the DisplayPlot debug module data
> + * msm_dp_debug_init() - configure and get the DisplayPlot debug module data

"DisplayPlot" makes me think no one ever read this in the first place :(

Konrad
