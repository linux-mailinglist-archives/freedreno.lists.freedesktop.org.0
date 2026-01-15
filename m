Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B8D23A57
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B421510E72A;
	Thu, 15 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fT13+Q+u";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0w6KwTC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823710E727
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F9WnYa2058009
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=; b=fT13+Q+uSb02fIzM
 h4i4rgC545w8qtyAkFc0kJOWypDAqXen8avlkePiwlf3UlPW7cpEApbtlun14AqX
 jGimsMdpQhV17pcZUXmj1FSwXBr49WZn65e2O97tQGzFiVSFgrOKQi58Q4ECfqoa
 7Wuhc1MhZBBj2JFlzGdjDJSIsHW8BNUcbH9quBQ/v7D6PFTfhlY5jS5KuuCCeATj
 ryZTZ0iJ5C2OC9OmIHqW1VFBS289C67L0Xn5vI6exhuEYFwXDDGr5KPcled1K3ls
 0HcUqBY1igIFN6mcsMu02Q6OsvJlBVf1ipt5Kb+gYUKYuECC1PUKUwFA0nIjqdSK
 JW/Z1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxg17p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50148ce6d12so2131361cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470143; x=1769074943;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
 b=Y0w6KwTCZgn0LSGlSJhT4w7Q+E8VrS0ubUEzEoij5PTyWs5pkLkfAj5fOwMuHH9/4O
 FyNtFnznG5r+nlulfNlL0DlGWrCQWOgiVzc8H9YlXUz55GpsYRdI/rO08TtJffdkKwO6
 xlVyFRwQ6oxKj8l+cdOs9CGhVOMdEuUN92zoDvWARjBVEI1JPvneLTG0i22cKXpOD9Mo
 toVI1By499FZVzcdQ8gqCyqGGbX/uMQCGpc55s3Qx8XoWECVtLUyQ4PqE47KQuz2Yb3f
 F9UDqMh4BP/Vq6LSbNm8Ui1d8HehN0+TO7Iiu7HCz0HLxeLDv9PJsrtRng0IJ0r33ZNG
 ctbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470143; x=1769074943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
 b=DE/+17xhJsM96H0378k+ZtODmhmk3XW3+G/8SvCXzlH/toFTZbkjBwuY7JWnH3YsUy
 kirwCXTmAFPWhMCo6/90Jip4tyX40AZl4jE2T7woNKK+IKprwHqgKOHQ05r7xE8kQVAE
 bEYLlkPaKYaHo/e4SyF4H/v1AcCEJIoDtIeNnixTfZ1jf31KFuLrqXHJrpKuICoq61NB
 WKcx/4IniI2mKdOCW3KhzODbWJGlZVe/V99ExGCwEpAlCwRMcg2WoF4dDq/aLJrEs+xL
 zwfnEHkjM8GvK9N7qOECa0RbWHoc98eeo7WY+YEb9TdLNDv2+TAxlrCFu7OCvBEqVSya
 HFXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW6DaUkwQuR/kVrQw7P/l/P0gcZ9+wbb6LNl5jjGl5xUwKF/Z34oi93Fpim16x3pX6Ej6IY8tkdcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfMKVdbO1x8weGtnBPvQtdm4Si/qYWODwxzk2iW1zl/IJ2dFw0
 x53ZQCi3cggmQ3L4cDc6x8l7ZPoWbbjWez95Y3iDRwVFasjCd1yfVrvO6N7Gaxl9PjTni+LmPPo
 1jS+hiTwrXwUxFgpoxj4FIoAaefJP3XVfrdexYYdDvDdegtQA1euRw1jzU0jZUjrY1ONhjlU=
X-Gm-Gg: AY/fxX5kNseIXr8/fpy0KW49obU7LvFJmc96XoP94gcrLSX6wVtzc+0OCXRafX7Klyp
 yvidL2+DT/JN/MVXmLSxtkkyTMP/So+/7OquW7j/JXrq500+MJynCSH+1pZDxiN7O6vurF+8dST
 oIR+jb9MX2Kmc/TYtmHVVVUc3feD/bXsPc0siJUqOm4yv069XctiolcdWAP+41ne67VVXPqhhfu
 58rtK4a5DymUJpzq9D4lnu8ozy6LjGwFYvESjverhlwKCLkR+b8SGNmML+oNahsQBkciT+mas9Y
 U2Q+jZsTOo82ur+etZXSphKiBLy1Qr6TU+DgIQ2ntiCJIVJZFCqBO+koXqiWG4xwZdEYxZgzpOs
 3jkPguVIhWl0WIgqznPpGalm9sHIMtARHSUrAcEJDluxN5UzndQZXMzwIeR/3kUOki5w=
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id
 d75a77b69052e-50148535260mr61573351cf.9.1768470143247; 
 Thu, 15 Jan 2026 01:42:23 -0800 (PST)
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id
 d75a77b69052e-50148535260mr61573131cf.9.1768470142796; 
 Thu, 15 Jan 2026 01:42:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86fee09163sm1459291866b.26.2026.01.15.01.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:42:21 -0800 (PST)
Message-ID: <8b44bc01-4542-4e80-ab16-10ddacc10e38@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/msm/dp: drop event data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6968b680 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WKJx3f7KLcD3q_vraEEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zBoejq_LoAXdIwo-mRWzf2MUVElNMYdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfX4JgHfc2ZCP2Q
 EFDhbGpcr2PJBL0VbVrLOdGdOJeP8ao09QuV7URDGw186LrzMHXxMEUWa/7hogeFPWWgjDoqi1C
 5sdS2kLiQjVRIh7qHEvUkMZxiJy/oJf6WFEK3C68mhHeTlgUKdbk+xjOUnt4GEhoBC1RSAnvTyj
 amoi0zHKyz+7Y0AAMjsmJv9apzBxnO38uibJXvFrIBWr8kzGl1KVHZOYx6uN5P5+ORaD0EEVNJC
 obqk65WhpWgV8leuKgVst3OYEZz3qyqmabcOo2qlX5li11RXhpbCr9LNDoVKmHBth2/7/r/9nW1
 zebIrWBnfxj9KalKJkIXulIOcxA/EavsJcU1rIZDEYuKVTdkK57EH4hsMk1Za+7fpil1hWDFPCq
 nfwmaqQmFYh5z5LY2x8SKN7XhvZ7PI7snsSauXNR/jsUE34CxQthI7jO6VLez9Hufm7wtxSuKHv
 iaqAPL7kgyBAOIyOTcA==
X-Proofpoint-ORIG-GUID: zBoejq_LoAXdIwo-mRWzf2MUVElNMYdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

