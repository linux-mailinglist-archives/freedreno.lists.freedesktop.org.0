Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3AB3F8D2
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 10:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA6610E5FE;
	Tue,  2 Sep 2025 08:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EX9CkD6U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004B610E5FA
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 08:42:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S95X013338
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 08:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DVOLDMkL9Q38mnjAuWvsREiBjv7OOxlteZXJWEZg7C8=; b=EX9CkD6UBxZldHPo
 aMWSQHjiaONNc/TR3XQosLHHh3KRri7SLMuP8UMVgu6ek3Zqlnlqv/KjGZ4Zg+ki
 lr79AIn+0vGCStBrKbv0sSTB9LazsW75KWxEWFYN5jhbBTQsznn3efvSO2Turcv5
 p61aQhe6PZYBjLpFWUvhtZ1do0ClQczZOyH6zpfhssWXwuIh2/U9oCpKMs9c5H4d
 7EFrbmA3Hiwtl7H72br/s25uQ91AL8Jh2XziFjxoaXc1k3zhwNfNPifJFwneKVV3
 d/yriKVzzkaWTY6sb489mCfVLNDnc454MalnKJ8Ggstlb52Ug1QV/JU377j5SMBo
 1RL8bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ff1a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 08:42:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4e63a34f3fso2058673a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756802545; x=1757407345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DVOLDMkL9Q38mnjAuWvsREiBjv7OOxlteZXJWEZg7C8=;
 b=TCtPKEecf1aZ5U5HBzErlLCGsXLZEsGkEjoRtdzI+BYt0mmWfvB6l4MgtIXyCpdXit
 69wV9J5mH+q/yPlcOJZBYyKGi9+kFu+4q4DHPItDEWUQfbB01gIiBGWjNuZK36udWEWy
 tpKKp+veogZenpOu4qMYmPDjxQ4QEnuV8R5ptfxosvMpgyY6MLpmyYPTU6oxrsMew7vf
 kAfqxSV0Zf2Mbo4iXSTAsJ77Ve70/5djg3qBOU9nuMWzMFlJnYvzIWU35WXAPItUQJ0r
 Ve1yTsopOXpPKYWbtur40jta73qp5ZkLx2Hh7GMi5FtxW5KzpJ20p+w3c/BEC4kXWIUR
 DSrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmUJkRmsJwPnYnoYhKzAxnSMa7cvoahZnUqttH8gGOdjPuR5aAV5GCSXKlx7WCa62WUJrr+iggovI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTKQnMGDsVhZAFo41x+Ncw49eOLGwnR69r4AEjbELBPmBLxdAI
 sdSJoaJiZdbgC4RHqUvgPJ0vJ1SXzU6UH6QPCQN0GMQx0I0uLTc/AE5pVVEaFbICM55eStHNPFP
 ZfBo95F/0S/lWYMpxoayzzwRFChJIdwyZqxeaTBnb0Kmee/6p9uloH6R0i60dLUSO1rU2XOA=
X-Gm-Gg: ASbGncuDHW8quzPB6S/Cm9WPhua7ruMKMI64CAfGeUP6O9+QmjR11cFKE1bLzcOFh4N
 rZ+gJ9H9ijo9/gMesGBN1Y+D5vQMEJNHh48zy9Z3hiUq1vSF8451AA7gR6CNmilWw20NpxZJiym
 U2c20DtLttFjKrnWZprPUoFp+acbD4GGpoVlD6yevUUTwz6gBmt4q2Icd71AaHBKU+WqFBKimQN
 ilpFhcGb83PRIZ7ZsaIz/dTb68CjMpI9CagN5Crpt58kE8O2qTnx+y7hhhlB68yf6wy8rVSXoSK
 yUR0jmn/vwFP5zd24IhQcob2VsUJ3xXT/9IUneb6PfdWsTP3ljvlCH3j0urnY6+O/h7AZwxlSgY
 TlaDCtEjM1SHZEjkiKRZF0cWuPO5Zng==
X-Received: by 2002:a05:6a20:3ca1:b0:240:af8:176d with SMTP id
 adf61e73a8af0-243d6e0624fmr15800445637.24.1756802544551; 
 Tue, 02 Sep 2025 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkZmtURUQXjUEaZAkZwa5KRLpMqM9mF0V2Pb31KG4aIt0jLndUPkUWRig5iFl5PBDxItRWsA==
X-Received: by 2002:a05:6a20:3ca1:b0:240:af8:176d with SMTP id
 adf61e73a8af0-243d6e0624fmr15800404637.24.1756802544055; 
 Tue, 02 Sep 2025 01:42:24 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm9992321a12.6.2025.09.02.01.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:42:23 -0700 (PDT)
Message-ID: <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 16:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/SaNefzJ3kpn
 rvkrmu3z42aesJ4oDu+PgKT3yzfYZAamh3lIvQspS3OBw0nWk751Fe52U5VHQwXWgV9zSfe2SO8
 rXDYmRO0zxLLA7ZSn8ZrphXxI/s0tIVCqHF1+zJKMnA4X6kM5HIJ5NwD/qEAvuEGtqSVK9CZFFu
 dbFouGLt2hKQZYicHt6/4/mGcLIpkF3wpcRzlpMmVx0dZGjJoF7nZXh4IsTEP+LvW5xS98wmKC5
 RtnpjwrLeDX1G+x184fjFntoKYuj9bcTieWLd9aLlEW5dCa7E7CNASNUhm5/XtbELTha65knMB8
 H/jaRz+CLtozORjGsuy16R74lPYNzs5olLjvkHJwQb9rq8QaMjwCwrLg5iZ2ibV4CN/RNg5dV8K
 YtHrua6r
X-Proofpoint-ORIG-GUID: GMEadaG6Em_EKzfkNSwRDwopasgKhPrr
X-Proofpoint-GUID: GMEadaG6Em_EKzfkNSwRDwopasgKhPrr
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b6adf1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=UzQ1Ta3AV69qgWW9qvUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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



On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>> state management complexity. This change removes the drm_edid member from
> 
> Please see Documentation/process/submitting-patches.rst on how to write
> commit messages. Please use imperative language instead of describing
> the changes.
> 
> THe patch LGTM.
> 
Thanks, will update it in next version. Since the HPD refactor series 
are unlikely to be merged soon. Can I separate out some patches from the 
MST series that don't have dependencies and send them individually to 
make it get applied? This would help reduce the number of the MST series.

>> the panel structure and refactors related functions to use locally read
>> EDID data instead.
>>
>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>> - Cleans up unused drm_edid_free() calls
>>
>> This simplifies EDID handling and avoids stale data issues.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>   3 files changed, 26 insertions(+), 58 deletions(-)
>>
> 


