Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOs7M4sjnWkcNAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F018187A
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83810E49F;
	Tue, 24 Feb 2026 04:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="in5jhdXP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWZL/esK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E2D10E4A2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3Koaq889723
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=; b=in5jhdXPGm+dI+7M
 zRxhPEVg+f8V7PHhb1sN++X3e6fjjKy++Q7aUV8HmubnVCn8QNhe6+xvseF3Lzf6
 o4bR9Gy5yzv/Wb4SRH7FQxBwiOpfp61oyq0MAJLgmb2ZNvzIkU4EbNO2aMzEjMQY
 62+SA0oytzwg/nWCgeSDF820eC2nH34TwtJ/kyHnTPZ18ywKQoWwBrTeP5oknAis
 kEo5FpSlGppaLMFLWvhfPXHI7V7xqaX8SJxnlQkVmbzdWdpk8F+7Xb9mdbKWRbzA
 RjUCNx0bxazBvtCPHKz/I7OAhhBwK2O1Xu7PmKMi+5W5g1NAiRXCjMtFW0mtkTyh
 A+KnKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8aj15-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb37db8b79so2609366985a.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905927; x=1772510727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
 b=kWZL/esK4Sp/DwLhZUJJDjzy4wl4sGegzghCW0v8nfh6Qo8n2ULXEA8Ek70mxyJ/aR
 dvXLBjkiTMRh6O8y708ETJj55IF18dbbx8RPyRrzVE3DBTZDPcbu09qm1V6+5CWIsX5f
 7KPiUCLWWTBgc1f9LdjstBGWOMxscR/hF9WcReTtrHDqbDEdLH95ag9dJG1SCiBYtvxh
 6vR+lKLqk3m9t1qcvJm1R4Y8SJvmNds/u5LnXsGCTdfT2jHdLz63mZKN+Zj6T9Am4G9A
 62OXKjx/3vzIf1GAvNalPE7CeulHJN7C5UBesLGG+jZywU/xtEq5I9ZK1iR9QQGd7AAI
 UiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905927; x=1772510727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cHruPT+MZxPidZtYd/ng3z/8C6BpKuAaj3gZfQJAAG8=;
 b=af4inBCjZV5VFk407nEC5AYFYvFca0nQI6LpIYtvxEcLNl3ZU9QiUHjcarMvItbpSS
 EZY8yU657i3oKGY6o3eumKH9UhEU7Z/Drhce8//Uk8sjU//jQWIGvP4gjAM4ziMb1O1X
 DVs/21ZIP0gZRVCsCYu8puY3VIWWAh2fI+oHDxpnMScUNv5a05zqJFKyT5aYSowDedjo
 eAw1DZK2bXFRMMepFrB3r2yOWMVejjjqiGAxNnWk+nYpxHRNKuFQmR1ZJThX/PifKAxx
 zMr7z5bhe72PIqiONx6cVq4j7xiZH+fzjUPY/n9xIlFEfFcr3Q2DI9pF+HgaAhT6+n2X
 N+8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGaNAL0m0gn/hO8d543k7uYjYDJWLORWAB9+H/Rff+H8VIMM7ujLfx7xFpKdg5vS38neOA6GNj9dE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/eavr+CU4F9HculmL/FDziu/zb8jvzS3NvVw+IQ/Wz6YHuCLq
 ++KHOebPqEAU6SwpCiQsfBAyGvQmYssliXwLyPKyV+v6oyAMpZaFiRmJt1/ZR3y5JBx61dmME6Y
 EJ4lMXLQV6zqwzVz8AVy0562+isf3ryZCNAkf7BRtyO8WxBzn6MLLL4/tU3bs+rO84oIQ77g=
X-Gm-Gg: AZuq6aInRgbj6sYDbzd0Zoy3LbCmwgPD25PXn94f3x72J2+ypqNDj8jV9zeN8SjMYep
 okWOUT5jFBusR2fWUgMqataJmQ/o/h39pyvQeR4/dGxJVDJJHMqggPTuMesX/PtUP66lQZ4jJJS
 hLC9No1/x5C4llZf6rBlPqDeFxrSpaEL6p9+zDxmSEFPe65XyYA9LfpM1GI71+VfYgC/acjH+wd
 GxSsKihZsF2nR//qJPomuik+TvPzhLocaMCI0bACX0lahm/cI/izejDX5f03UemrXNavtm5wzVw
 thTOlKmWoVfYeX8Pe+6APqlk0yfrObtwQrXtME904mgabEtWvbGX/TocIZJiYEveGx9LIMc3Juu
 ekKdHgH0huViLzOU351FDyV+gntg0T/6AP3vRJRzxPWThRsua0kUhhDJLqokbBeaj6LzlbFn203
 YkS69zBcw5AhTM47/5i1lyN5ScpJVZrH6Q6eQ=
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb8ca76216mr1543759485a.57.1771905926500; 
 Mon, 23 Feb 2026 20:05:26 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:8c9:ea27:dbdb with SMTP id
 af79cd13be357-8cb8ca76216mr1543755585a.57.1771905925962; 
 Mon, 23 Feb 2026 20:05:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
Date: Tue, 24 Feb 2026 06:05:23 +0200
Message-ID: <177190591482.429979.9121382739276431016.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
References: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX6ivSWDmKdOqH
 0LvhfqK5/4h+Zx2619Fe5qrLW0R4tZy6I6FBV4cGOdm18z8BRcBoQbK3KxMDsj8JAoSq6lzWr+x
 qZrRMU4AgW8E7XDQA3IPkfk8ckPiVP48+P9o67sr9amZEJbf3rHCiuTwQ7TWgS3rKsZXwJVRnXM
 0R6FgPwjE9BnNP1AFaW2PWRGctiPytOX7LW/E76F6CBg2sYjeZVWG+tDc3kvGzZPeUYW8WwbK8C
 bdJpjIYLGquUImzZYb9TAy6o2f39dV0whxS3TiJSByNnpiW5SEoUhh0hhIc6cy7CnRAkV8KJPDF
 wIU68jCK1OVmJSZZ3ecJvKvlwILxwt33kdGe2TscQvlbaw5l8eddpkKHDAJjItmGEVxNOhpndMA
 wMKskW1kbYqBUVIZZCZpbRWLhmSBn/6bCCkYWw+t0gXKKZWJnVvqh/UhuxETo/nIZFNnlxjHvjC
 HSO5gYyU9a8m6IVoGLA==
X-Proofpoint-GUID: 9tKjp47VoFzeLzPcCmgCCALHOrZpeaH0
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d2387 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=UNbtbxbA6Up85joFnAIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9tKjp47VoFzeLzPcCmgCCALHOrZpeaH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 298F018187A
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 06:32:56 +0530, Akhil P Oommen wrote:
> Since it is possible to independently probe Adreno GPU, add GPU match
> table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9dece60cc82

Best regards,
-- 
With best wishes
Dmitry


