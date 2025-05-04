Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AEAA87AD
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F4610E0A7;
	Sun,  4 May 2025 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN5hFAEe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A2F10E0C2
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544BcIhQ010740
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=UN5hFAEek1zei9jk
 i+ey+b23GE5m8v0soCodqbAk7BIMQ9UxSa2etCQLexjOb50jI3RqkrXM3ZSptuEw
 YnDbu1OwqigsjQmynUJmgkQk9wgsrZ9M0zP0s8mwwC0ORKaNj6128QQYzdH26Qdn
 m+ajBudEMr+SBCAbQX9qF3lu1kEpUpUdq98X083XqBVRB4wORvvCqPnYumNug7BI
 WfBUA/owmqHe5f2qI5S3q4qkf5SmdcOI5H9yBlujFjx2o29O58rYe/0Pk616/RoB
 m3oK1rl/vFJOOcIVTV6ZUwsUV9OTsZ1prG5jlHTQjpG+4Fj/zW+lfy0f0S2wIDkD
 2jM7AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so643734085a.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375215; x=1746980015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
 b=WFDrC+wT+2j9rPSIyuPD9Bz6WFKeVHiQ25Jb4Q3jyOlKVKCHbXmjNqD3XTKBXyNn84
 cNCwSmb/kNC75f4qFlOLtpjXjgHAFg5zxWM0hdHVO2V+4BBMVqKAulQ5aGX3qIc83BVS
 inPIFEE1V/tWJrbVwukymgz+Nf396hzD3BYPFjSOX8/2mVdtEmBhpq389T581LaiXxkt
 1l1EWfIMOvTmZK1FhsiRvazJNmBHHU8/88V7m326QfgIy0jH2UMLyeZJXGvW8n7Q5N9T
 btenogQcUHIS7+jco5w98ttpeCTBVJKPOFxeQBTSMgkTXtuCjnjuGB3FLecQ7xDdDijE
 qHug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmOg8AyAozpatb7hWojG7z41/QPDKlULYIY1SgJW0GGTSzSzCV+ZIAG1aZmZ2kSqekohldHefPJVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2arFdbQy7TJPq1aji0VWEtFZi31Gzvcv5BYMiqg9b3FpMZLhz
 zd3o5anNc5yVmRjDBJKwzc9HF89RJvcBpr4vRul1rl93J1dNwWwZJQvlyVGmfhD+VT8evtKkKbD
 Wj0dd3jMVlDPtMFlgfaBZXgtcw9uMRQPiOlgr2ysZugUlBLtKA14CZw4uhVz9A2skwKQ=
X-Gm-Gg: ASbGnctwS+80rZ4zzEwGF0hyx4jp05W01DpRrzWkL+Vt2P/5T7vbeG7SCeasZgRriUa
 4ntkO+DDVeoUNU4IHJPPHLd/AHXYEv/Q4w53bUinz99lPMx2MORQMkbIsAunzuH30sFC+RexEoA
 7kLloAT7F2jGSF0zh7X/otUeIMYqY5DzPDpdB/9Yis/+iszNSW9+XTUUSB1Y3dNUJLJOPpdsBpk
 4EN3FR+OEezeURGtADsXuIsQbzCQVhBjNRMJ80mKcVw/ILHFzFgMEAEroTa9lByAH/JzrxdmWqv
 tdAFLs0sK8pwknxw7HHkdQpROa1p5yS1CBSMOfurI0JJrJ/9I+1FhlRpWiKbfRPnxcceShSUu/e
 RSua4ZbrqYwUpFoTkt346nXs6
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id
 af79cd13be357-7cadfed926emr912055985a.50.1746375214997; 
 Sun, 04 May 2025 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGco5fgaYnNMpsBBxEXRo5nZ43X/rGRriKVtlsYHoJbTZ+8uY8xGUEUU9xBouzMhrR9HrsDow==
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id
 af79cd13be357-7cadfed926emr912052685a.50.1746375214680; 
 Sun, 04 May 2025 09:13:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sun,  4 May 2025 19:13:20 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6817922f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: S_YdbLodsACvrFxUzF1TIXbIF00gDPze
X-Proofpoint-ORIG-GUID: S_YdbLodsACvrFxUzF1TIXbIF00gDPze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX0KdcI7E5HxCi
 s/y060RLce5PlpkLzhnV4+cQMdj4HTKyjCB0X1wkUmO5BtMe15LVth7ei6ggn9EBtW8SOr/hw7J
 FZCv1DeC6aBLbekWP/4qqlKNk614jAiaE0wp9nHJNWzPrLXRhzSlsFRFF+Wb28Z58S+kbvlFz9K
 P++aeQgTBgxLkmEk6B9rP220XQpSPwD30KIqJ1fSVNR+lixXCzpamz9p/IUuIcoQ5Rl7WfPornC
 Zcu9X3k47IrL/gOdyy12UVKXQye8DyyyzjRWqtj+vSg8u5CWO5HGYW8UhoAT6nUdztS0Dvd7YXW
 dnvLWATEFyayrKBuUVVcs2AXzmywk9tX4csC+dVxLW7mlvc8JZD1WxRnubcU3gE9P3pmzuS+lzg
 3PfeHQSPQjmpm1yHZbwHl24V+xDt2UuNM98BKr+oWze4Rf2XsxNOypB5DbIUPO2wJLj6ALGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=579 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
