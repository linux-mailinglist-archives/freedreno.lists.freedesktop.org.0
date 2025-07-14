Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF320B03E98
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 14:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682C410E484;
	Mon, 14 Jul 2025 12:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iV0HXkOD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8110E484
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9al6O012328
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6EgrQ6Evaclca/mv/a+/ccLx
 hAtqa936HRQUO/m+epI=; b=iV0HXkOD2VYKwXwBtVQRczeh4oiytnh9ytNquBSz
 x7n0Yh8bvnNPuGZPy28cMQ0sug9hN77RWUK6i7uHw6hEy9lwrEHYyVxjgxB+J1BA
 3HhiSlTLoetbOSZBja+g2C/hRrgykzfBtXgLb85ncyMlHhJ8gnRJQ8lA8rFE7DDf
 oFfOKQnx76lcX7jMZQ4dW5gV68AlN9sXSJW48UnR3unpSjC2gh9ip7TRceFaUNB+
 s/f+R7eomha1r4I5VpPkpfG9sJrvU5wms/ST0YtOA4SZY+EAtMGQ6s3TnksMubcP
 aFmdqiGz1gFuL6fml9c0XxAzp6hrfKgBC7IOis2uLjDIkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhcnpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e237c2f4ddso208181485a.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 05:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752496042; x=1753100842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EgrQ6Evaclca/mv/a+/ccLxhAtqa936HRQUO/m+epI=;
 b=CmsBWc1zJML0UiWYd6oe+LrGJW2kW+H4BUXS1wexF/P2ujMbKb/k0sHK7UyFlPd7Xs
 x2o7p8LEoiVutG5Q84an3X9ZSkw+El96eFRFmScrYlmPOoEnV3/wGZknZQ7q0YKlL8kl
 4h/2nP74Pb1v0w8qFQjA0zy5tVMv4Nnc5Hc5bDFtf2nghvTvxwrp6mCp6/Mg6YaDAs7F
 9d8uq8xlnW43XTuKytH/z+7R7nHDBlfk0N3cdJfokzF3qE/MyJryil+sYRWzVWs70oC7
 /YV0WYpLZdlqEVRxPnJFBMSoL7RBW0IU8VpeMV+KfK9oOD7twKT9F8Xm/SLKl3/W8GgA
 RijQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuBcpoS5JdL/cHuZZZpk5XTR8SN4jq7PwaQ2iZk8992FTz/BuMYuaJlnkCjw+ZWdjqtsyb90G/Yk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2Ys5eJGhzrPT/CaVxmCClHz3ZsGpAdaj/Hz/rLTjkhrdTsMg4
 YdCbpiVqc78HVtEUpCUytwE1hLnSIixFqpg1f4ooc+MzCsmSqDNpaJdQDGEB/oxxrh7zlrsU8Nv
 FDlH6Y4PzEt4HC/dFGSWKMPi/YnJSMCaXHFDf6ZhT6ZuUmDx7+vTA3kKJsEy3pRqfR76qXN4=
X-Gm-Gg: ASbGnct/54TiCql4rMC1n9S/6J4Qyo8ptyq+jj6bUp1tTlGtRRlwQSLA+pUBMU1bGoc
 IN/h9uh55hSJCKLaEjrk3a/TPlYWk4+w/fSSYUsf8P2ncHX2B2Rq3rcK+iCiMd/S6mVmajuw2i9
 K3zmN2ETYA9P3gat2iBSVrzN/8VmASbwg8SB2keHlHaRvLirH9aeps1gz85qm1gttxIMXpfucGz
 Ut9liBwQejv9Rye1SFA5be2/R2nywpCJqlpbInRNbOFTsVE+KoiQpzb7+MNZw68vAvKmAjvxUQd
 kg+xDgNLHbd6JpgasGHujuS7Z1Zo2ck4SP2B8skQEY8bJMzvs3rF5a6T2slmKFeNHa9JaVVyd4x
 FICdHOM7JZPOelSel9oJRRL6UH/BcGtC3/ZbYEbxY0DJtc/1iuxOJ
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7ddea81b3ccmr2041494085a.25.1752496041889; 
 Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DL8IYvSTdgwjCn0jn6ALMNC2tGNJGfPy5aqEL2dhHJ1me0Kau9nI8+0T6UE91J0zx/Y4eQ==
X-Received: by 2002:a05:620a:3704:b0:7d0:9782:9b05 with SMTP id
 af79cd13be357-7ddea81b3ccmr2041490285a.25.1752496041286; 
 Mon, 14 Jul 2025 05:27:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6b821sm1945844e87.182.2025.07.14.05.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:27:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:27:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on
 in msm_dp_hpd_unplug_handle()
Message-ID: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3lPYtap8DS34sO043uw3a6sEtHU0e-6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfX0bxbMax+Nshn
 7oy3RxDV216bsQbNM41T3zvZnpnPChZC/qhhP0WRuP/8f5rvZXuqWekQeHdWJXWaagx5F9HiKvB
 w+79tEbJRmZLiAp0b8nZll0TD+OkYLD8agzqN0keFfDT33aDlubKjP408XKBDxOTODC5kREbSZ8
 hQNqMPx2Z3owHSo4jDBd9G2zzcHwTcprIHodsL621ad80qmh1BIARsiKMWNffNigYJ37d/G4FxH
 ngOeVqF8zziV6IK29+1/JB5rU8V/irDg5RDHvTsibjLhRx6Hm3MalO7RHA3AVj7eUnAwOBqsE7b
 aZHklnnYOxwbgBrP4uGRkB+IFnqaQAxvk++lsMk9TBy1bL7lMvaGMaLZe5YRrfMKuebYG4nw3BK
 ywKK8y2trcKJ9rtp8CHCm2MpG4q37oFcJyH4YmvFkGRrR+rXNysMfURQje4wtdR+V5hd1d3c
X-Proofpoint-GUID: 3lPYtap8DS34sO043uw3a6sEtHU0e-6x
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874f7ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=JFUgQLFdXU3b13EZuZoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=698 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140073
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

On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
> to ST_DISCONNECTED. The same result can be achieved with the !power_on
> check.
> 
> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Note: Taken from https://patchwork.freedesktop.org/series/142010/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please squash all state-related patches into a single one. It would make
it easier to review and more logical.

-- 
With best wishes
Dmitry
