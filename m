Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D8BF1C5C
	for <lists+freedreno@lfdr.de>; Mon, 20 Oct 2025 16:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81D310E452;
	Mon, 20 Oct 2025 14:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJUZLJik";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD210E450
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KB82LK009814
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=; b=PJUZLJikmWQP3BlF
 519kMTMz74gHVVnCpksl8pQUEKNqaYAYhqquCzDaIwYoi1bL1Nl/2mKVdCQDg27+
 skeVLrdlFK9D3ZsItTdTKGMjYQGX3W3I+7e6DURs3uLlSJELCdnDKAg1fwrwL6PU
 MI0ss15A6EXJtv5Pvk3kxyg/EPbBhGQTq7H9Fx7cRd4NJWIPsD2GX+Ii6kceXBOA
 7f3R9REKSTyyqqC8t8mqLYQ0FAXz56YAHOePkbokpvLVOEeiFwt4bBkudJLTZOjb
 EVu6y3l92CHT6xQppMYSSu9Wl+RDhyJgz0SPJ7xw6T9TvSsTHK6kh4HsP9Qc1pYp
 blQmCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2yv4wqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-88e965f2bbfso196377185a.2
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 07:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969722; x=1761574522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=;
 b=iRobDlXCWGarIkP9YWgSXC0swpsevcAbWo80eK7xEWd7t7dA4mh0/K8AUrc/45XwZB
 GTIO5A5tbZBNl9CN1yUsxopow6LHTLXo/w8iI9igFPm/09Nbo1+76PsHklPADHYQ6B8g
 DXU2XTs6blLnwJb19adCsF5n67e15qpuLIiAvju4MgjfwK7QlMGx9340K4AeQng5k7pI
 ZS9//lyO/9J0604pDACD8VtYpXD5NH3J4uTQsurrlz7Cy69tFByzjAlxtL8axBE5eiWF
 d9l7M5aYZQwyH5NKFyIiX5xojyQHvAO4Y8I3yQ8QxlcNZRSMv6N7WjF7Y149lx410iYo
 XTBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyum2emeFGMxpcBWYaqK4IUrbAgD7z1Bwk6PyuVF+qkBJ3gz1L7lcSxxalV8eqwFFJth7XiLLaTyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+a+jK+P3xwos8q+3wUNYkH7HvSEWay0LW4Q5sL+xXAdvvNwuO
 M0moIb5Tj5xLyBv6K9FTJ/cafapGB54f6LDt4sPeZp8TdE1L949/m4bs4Y4p4C0cLNcGbLlu4X4
 RJxVauUIzRn5kdoxKeF1w5XXg02v9+3frsNiycaR6X824ZiyKwQ1cMKMio0u3Jhu05/VMT2X9rD
 hJ64Y=
X-Gm-Gg: ASbGncuR6AuBWHniK5+NApZtMk1bEdMNB5ENfXlO2669uF+whs6SD/pvDQQ1joyb6Y3
 oom/d8Ilb52sAhzMypu+fELITHj20pohN+qv18Czj+5ydNJiewpQSrLZ/1cT4aC7E6QBGrJ0MPi
 fak4xiPG4enqCMyDaP8riUFNm4pJkrn2LipUfeTNt/66WZZVzqvWLdIpdNaaNSlJktG33ddF5kJ
 3ee9JdXmMfDCCLKbyUqD4M6oz5/QsRJ4Y/7PirnjCFr4jLcq3Ie0dNLirXjZ1BL83w55Vu9xrtS
 J44KGRxYC0rwZJ/RoKwuuEY+3ZLVnQ655cLlhc8BtdV0YTHN/tlGQfqs1cJ/lfWiBCPldR4afXy
 JdN0ofVpEInRUeyZmax+hTA8m1duE0E81VDs1nKk0rNaRvamkoNvSRd5c
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4e89ed27b1amr70538681cf.1.1760969721864; 
 Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgFJIAqpM19kvrDWGwCuBgqCdJgurbW+8pv+OyXQ/fhgIZbl4A99RK4rC5R2fhCALO5DvG/g==
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4e89ed27b1amr70538361cf.1.1760969721351; 
 Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949bfd3sm6749303a12.41.2025.10.20.07.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:15:20 -0700 (PDT)
Message-ID: <88f04334-8d73-4ced-9c46-e69c3e6cbc72@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6_MWj641KrC12di8MScO5xIL3XhK6QcH
X-Proofpoint-GUID: 6_MWj641KrC12di8MScO5xIL3XhK6QcH
X-Authority-Analysis: v=2.4 cv=f+5FxeyM c=1 sm=1 tr=0 ts=68f643fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QfOM7-ESXlBk_NPiMl4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+fVW/yW80GsY
 AwdDvq3VfVe134qHosi+IB1aAT9Ulz2ESMcZyzoVWLqPMtwVfsLb9dA/hdPga1wR+hr4a7cjwz0
 mIK5OzZHC0p+76XqbCik3bwIburIHaLWb5j7AqYSbdT+g8d4aYXyMZ1J7aAGPEG/rLynG4I1fwd
 VykU23thZUVPm2boCEzAoN/+bHPwStk4/PsqujUOF01mVydzfSa99ePn1SjodvYtopZHXVhocW4
 mfUG3EewuUvPIN6kuqaAO5IPWhaVwp0dmuV+vjYyqVOHq6DhQ2Kc+pyy97gRrKW8Y6OJOpsoCCC
 UWVbCK6B8/A0m/q1N+GPqYRpupAjFHZ4HKsHR2Np/tgChFDql4AnFdsgrIXfKlHfwhyo3w4KZmi
 /bf5bf/h1lkr27Ky2Nrg70XL0UoDcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180023
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

On 10/20/25 4:05 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 5/7/25 03:38, Jessica Zhang wrote:
>> Filter out modes that have a clock rate greater than the max core clock
>> rate when adjusted for the perf clock factor
>>
>> This is especially important for chipsets such as QCS615 that have lower
>> limits for the MDP max core clock.
>>
>> Since the core CRTC clock is at least the mode clock (adjusted for the
>> perf clock factor) [1], the modes supported by the driver should be less
>> than the max core clock rate.
>>
>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> This change breaks the T14s OLED display, no modes are reported on the eDP connector.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD monitor
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD size 20, SAD count 0
> [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 113 (1)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 120 652260 2880 2912 2920 2980 1800 1808 1816 1824 0x48 0x9 (CLOCK_HIGH)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 60 652260 2880 2888 2920 2980 1800 1808 1816 3648 0x40 0x9 (CLOCK_HIGH)
> 
> With this reverted on v6.18-rc, display works again.

https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

Konrad
