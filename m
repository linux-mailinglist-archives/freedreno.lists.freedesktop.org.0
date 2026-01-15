Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B9D289D5
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79C110E7CC;
	Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLCuYDU1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZa367l/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183710E7CD
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FKWoX73620357
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=; b=BLCuYDU1bCPJ8K1B
 SMjj3Q8YzHy2n4T46aLyeOFZfG0o8L9ZNWFcn+33LWmxfhFL+OhjP8Y8ZKVoVf0R
 RnLczsGC6QfOqIKrTFrAyt+qOss+7Z8W8efYArf8YnrZWFmFkTjdmEsCsEqRPaq+
 bmtyiVfGbX/1pBR6TGa+dpbMwqdqTIt+3MhGJYcctMvNMnSQ4P9ksIOGn6g/wT0A
 y/NB+ezVOAF6qZQ6rxZuDZi7apd9xUNYD87iYkBocGY0C0SqLOxmKt1YnqPax0Yt
 oUVIieiZGH4ycxnEc6uU7Dzo9FDbqiTvalWY8zytE4cjlDphn/JkkpAuDgzo2Mby
 2ELtEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq7cc03cj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50148a2a5baso40282451cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511158; x=1769115958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
 b=NZa367l/uXDPLmRdmUzQtMcJy/75fF5svbhNcKAMeKpMGjnsjlgznBz6jQrlD8l+rW
 JPX+SLVhZRUXTDafcuuYmIcdMdR3L9vbaG8gR8Ck9ulF+eoLNYrvGtP/WuWSB/0ZNEMp
 WuZV66pDZRtw0C1+IY5EzZ3QvPM9ZBNb8qgay0rMxIh6EIS7yBBjIximkvsWFsBY5Wcs
 CYVAKPRMAKcOMdNv+Rr04Yh9oKCLe7qFcmsF8sfVuHr9tDy6Ad8X+wfiiulys51S1Tvd
 S2v9MEPhRMCRnEuy4AnzTpPWQPAf06GN05ti7v5MQp1y1i8R+jpzKmSoMhDEQhHTcrLw
 DLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511158; x=1769115958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GtQFSRK5qZ7fvnUBt5V9UTPtwSbbuIbLM60jFf/YhBw=;
 b=nCj/bJNFKjDGOPm2+pwJ0DGgdEKOfcetz9o/wenqphDIqc/PIuMbZ2teax2pd0aL5P
 i8/YOJJ+QzfjODEMvSCur+Io+vvSh+GR2Nlez6lEQezEpzLkcHWmC/QC6i1lHW1pCnRX
 uMl8ZnV7kP2YV+vdZN12EERT8HH+YO91c7s+r/bd6q8LBzR1i1dwAgQ814iVSeCm61GX
 N+ZCczwOhKrI7TbR+E4jXEdyFZzgrL7SJQg8k2SU49FZN4vMyB9mkaWaD3BEv4omA9OL
 caXHkHzpvKqM1c9ff6KWR9Njw3ZnlOor6uG3qoPypU5CIZTSaOYQEX/RsL+PG7tz1TLt
 yMKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXauWNtvMEXbMaF4b65UthTzerCB3x04zn+sFSR7Y0MZ/4/cz2+NzE4ZEcPWQFxnzJ1X+Ya5R2+Bd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyPG6lK46cfiycYg90inKnk4OnaAWbxDNN8MoS4hk6XnXVAyPO
 qDjhCwKjF7SCERFUPR4HERQCnS5q4/NhxScZYsjzwvsXhEZ3Phv0wF2xcS9163Br4Qz/9DuzFHE
 Zo0W+fGvvOfIkYMaS2w2ROc+kmhEWBMWPjyZlmQHI82AAHkyHFRJtmzr3DiahxGKIxggyvQE=
X-Gm-Gg: AY/fxX4pNALqFZU7eTrBJ/DY+b95dYQSbY+LiunEItKtGINvAq5tK9mUPmmx4WWsET1
 2MWGJNHkiWl4D272YEf6DwGx1eIRhWXgDOyCdFfSVSOXR+wBOrg4OcDySgAALAFxj2NBNabrgUF
 OSZFhU5iCmoooRLPvI0Oj1WD8mJ1nAY6/NnQetWKSu0jivMNpT5ZxLpFbNlMpW/DqiCZ1fWF8B8
 nGWJBQ50ImSuuvR+KimGgp6MMfi9j72aUwFXi9wpEDg59+EbaZnno63+4PcL1xgYybFYtij8cLh
 UnQJPYEwviMUz3RtGPdF9/ZZBD9Ier1h5HJaaeWHlJpyDdZNDO//9LoZAEWYMYxYUPBEt0YyDQ5
 OhRWNhZDmJ3/33qSycNN9ArCswRQQddqv2ZWZUP1c+++kQlIh54qqFGJVqL6EJXPU7GmZ0GXgqZ
 Lpy3kP8aHkCg4YQ9CcnJMpsBw=
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id
 af79cd13be357-8c6a66d6b9bmr126200785a.11.1768511158444; 
 Thu, 15 Jan 2026 13:05:58 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8b2:defb:73b3 with SMTP id
 af79cd13be357-8c6a66d6b9bmr126194285a.11.1768511157859; 
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Date: Thu, 15 Jan 2026 23:05:54 +0200
Message-ID: <176851111170.3933955.16914793365873145717.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX5muLpQ7QnYYF
 zXUyYel3San9wIRfebTTciXq0Gm06sHf0n+SpAohFpeoedJ2i5Z/3R3ZkBfzjVUKQqcfDEa6HYG
 eyGfi8sL8/Vqx2dycRzJbkA/nBmKbxWPWnx/xzeJ6PsdimS84vy0y37A+u3zU3jofWyauPyaUF6
 TC1sX4JpsSpC62pWzm6AvtH1OzDPCGcZs7yvgBpiI3mbw/iE0cUlOCEt6tackT5TWeRQZhiYlp2
 3mBMV6Mf24Xf04N53A96s4mNmqSrM1SFI6K3AAB/3fykcVR0BtMgK8vlPfp6/wd2jSeIzZc4Bjo
 tK5Nk9AUa8LrlnbyGaS5wxDdilEdtFzGVwzHDp3ZkkKUY+TNvxrevHY5zExfdMCYzmup7q0myrI
 5Y8e6ty+7f+HkgQOEbYDzMQSRPcQirQKqG7u5i9FIFzSq37DIrq+wa0bkDsEitj8CagNFJfFnGG
 SStg8ykH8noWu4xP0sg==
X-Proofpoint-GUID: f3GPMq0DEvCjWkQjstaLOMtmWdVL7Utf
X-Proofpoint-ORIG-GUID: f3GPMq0DEvCjWkQjstaLOMtmWdVL7Utf
X-Authority-Analysis: v=2.4 cv=Z7jh3XRA c=1 sm=1 tr=0 ts=696956b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=KjdWIj8vZOb5hH74MMoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150165
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

On Thu, 01 Jan 2026 10:34:38 +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/disp/dpu: add merge3d support for sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2892de3f4f98

Best regards,
-- 
With best wishes
Dmitry


