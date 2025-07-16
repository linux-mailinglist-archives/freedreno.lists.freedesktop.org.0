Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714BB07235
	for <lists+freedreno@lfdr.de>; Wed, 16 Jul 2025 11:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061FA10E76C;
	Wed, 16 Jul 2025 09:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8G5rT3V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A762010E76C
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5laFX024266
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=; b=K8G5rT3VZqEf1Xsz
 L2slA5Scj2znACUJCnn1os3ea0JrtuofpHDS1HGmWV762DG14K0RBeW0OpHrlJG4
 /8zB7xOEFC6ER+rGOYjiFJX1NF5GTwCBe3ckDzwMxd7d2uiuXZ2ESduVj+NGZPsc
 kZygABe/78Kk3d3e1lkcIu+HLNpZhjcd9dsipjdP1HzyFGZsKk0AEjyhm9GvynDi
 zhK4bW6VQsRF350uyZ3MrOasq9Do3YON2XMkEd+7PHGRFxxoo+Do70eqbGyfjZ5e
 jIbooR/RsXlpQ+KkKhdFNJhuY2oY2PfGj7cjNoR1QUuOCoeLCESnryhNi31gfmTH
 DdbZtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrum4b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 09:53:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7dfd0470485so127906385a.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Jul 2025 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752659634; x=1753264434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BrRuWIrtJJsRpQld/wY76CeJGwT/OepkhOwph9UVdAc=;
 b=wUPC62kAwPNi8fTh0VHOt9PiGosnnZbrV+I3V/QO5DgdOBO6Ny+WuDKU1vGifQ7OYt
 uW2qLFKh0QZeGRU6N0zo//vXiWfCbzLTVLQt+vg/q8by4XJgOJnpk19YnDsFJg+l4Kjj
 yeTChrNSpNBKAmXvBucBBdHERyPzwENY+PrpvcFEXVmkUsnjcTBsefJ5rHxVgN8rWmwY
 QUpA69nGqkkUTr9KfInysEHpgaq006XyW6EylMlI25VnChzdwth2APzrDzPZEjp+W04l
 HMvCVc1RuV8XtXHT4zqSGgmDMXdkQKKR1WGI5ogJ72vSwJl9Sm6Hw8oFSSQSwabSX0rp
 xZFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIjF8e0MMdZ/TCUayGlV/3jsf+ja3SNMmPfYYb9+BhpV0p2rD0V/Nj0YEn/hs6a1fz/1XdpyliMmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWmd9cUvucjRVrkf9T5P4F7BfUBQ58veE7GMooiNQDjZ/2vyR4
 hMmvCioX7STgSYUPoCiorQovCrmsc4ZS6aPowkvaez61s1zKMC2Eq9pXf/gx1dDKvwb1h+rzojP
 1tZAtMGWrh2x/4vvlCz0SUa5Hwf6eBur4akeC12Z0Zq3pspSigpr0t5nW+bBG1xZ3ykAou+4=
X-Gm-Gg: ASbGncuxQqW4r5vMKYRLh4AOerbpHW3sLCV+27hOUe/T26iUXa+RYN5kJo0vG4BIOEQ
 0P/FMvWr9yGtG27Rzz+IciEyDsEodOlZ/qcFnP9tCDNlyMg0JxnPu6NI7dGIVWCGsP+X3ZoB0zp
 AEjbDAdREOewPN9iAZzXoLWQtQKxHSYeObBGjji5HgBVbU/r2OjIlKkSRKhOjpWP8E2E7c1vug8
 weWUupksR/aizRCBpuj0OmZO9CuwGTX8fEmfy99JVW4A7m3SRT19lvhH5ySNSJT+dpD+6wfTEza
 GzjAby7Ole5tWTpRYKQZHaU0YH/lHCOXydHpJmCSxusG/Z03zgyza0T9Zx4xAqLxAuGhmUzwRIU
 40pNrzzFUCTENTwbiVhn/
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7e342b5cf66mr131696485a.12.1752659634370; 
 Wed, 16 Jul 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkLEZzcnbHfPM3SUr928KwExQhJl+kNQoZGqThwXwhpNJlenla0nHYpg95UHWVYUVk0gHrQw==
X-Received: by 2002:a05:620a:2949:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7e342b5cf66mr131695185a.12.1752659633784; 
 Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82669cfsm1147729066b.83.2025.07.16.02.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 02:53:53 -0700 (PDT)
Message-ID: <273b7fd1-2554-4466-baeb-792fd7967209@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct dpu_plane_virtual_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-msm-fix-virt-atomic-check-v1-1-9bab02c9f952@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ypINuLC5Ll-aldICE9D6nKaufZnxE_tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4OCBTYWx0ZWRfX5P3mtFvH1jd6
 KDDYki2vZqDZuz8Tpubv4W5Z+jPYTuVk8fVseD6ZLYG+hfK2PFkZYTIFRjIR5EUWLOBqFSGMyqq
 eZTYxppSD0rUneLJPWCXoxvl7u1DrO/WiAiHz4MrnqdNKSAiz3ku2C66hmAbu8SNdx2znFh/a3t
 SCsVdGcEU5FAPFvPnePGUr2+qQ8ZegMluryR3DufBL31RHwFEPS2hFq30+ZDaDe2oVEtP0bzoMM
 yyUK1FIqji/TKJlCg8e4IJpHiutTBP5UFBjzXNVogmKe4HpEhfKzUOgMGiLpsbzNkdqv1V+V4Vl
 voVQG57Gcrkw4XWLec3lq5zGVRgXLsWORDaIWaaQ2TfGr14MY7aGmd5JaBLpFMlhRDM8D4JSDl7
 h8crfZekHLESufVWJQIqdbIC1awA+WJPYopWNeiNYC1AiC0EG8rwVaoWQM5eny9dTRkhv0wK
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=687776b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=GHZGt2_Oay3Cuwp2bz4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ypINuLC5Ll-aldICE9D6nKaufZnxE_tx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=551 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160088
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

On 7/15/25 7:28 PM, Dmitry Baryshkov wrote:
> Fix c&p error in dpu_plane_virtual_atomic_check(), compare CRTC width
> too, in addition to CRTC height.
> 
> Fixes: 8c62a31607f6 ("drm/msm/dpu: allow using two SSPP blocks for a single plane")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150432.U0cALR6W-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
