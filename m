Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156947B0E4F
	for <lists+freedreno@lfdr.de>; Wed, 27 Sep 2023 23:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE65510E08F;
	Wed, 27 Sep 2023 21:44:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3153F10E08F
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:44:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RKOoGo030107
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=content-type :
 message-id : date : mime-version : subject : to : references : from :
 in-reply-to; s=qcppdkim1; bh=FxNqXow5Fdl3IfW9wnbzshm2vryM88e8LX27Hz+f118=;
 b=aWvmaBoYkPdd33hn4ZBrjzYxTfm1XRUoDJkt2cOLsM+CxrZABtlG3LwU5+vAMO5Ohful
 PXWcoxHfsNWdVChlIDDgNhlFE1EGZPlQXcTrFh2wqWRtKH55fF0qTCqM+6KDNRnKMKZO
 XhhxuhxB6//KyWpBGcNGxsHW+vyh2QBjpeUvnxXEI1zePcrlNB8dyqX4CZAlIzREqBZS
 Gu2ke/YXD1VtX4WIZYUUUqWErZH0Vl10v85bBD9Dq65aBPSuyr9KsbkSLUz8eAARM4EK
 gCJ6PAkOdSYjVmGf016X5aWKTjUq0Za10o/XFSshb7eqkaxf/mq+iFN6GenInf9Jjh29 jA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tct5gr8s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:44:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RLii0v023223
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 27 Sep 2023 21:44:44 GMT
Received: from [10.110.47.87] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 14:44:43 -0700
Content-Type: multipart/alternative;
 boundary="------------9MHLTxd5KyI0e75n8QNUqiWC"
Message-ID: <47a814da-3e02-2c01-eb43-ef08478ae983@quicinc.com>
Date: Wed, 27 Sep 2023 14:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d_KOenVepeVlNP-qk0zxv1DsECmsnrqS
X-Proofpoint-GUID: d_KOenVepeVlNP-qk0zxv1DsECmsnrqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_15,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270187
Subject: Re: [Freedreno] [PATCH v4 0/8] incorporate pm runtime framework and
 eDP clean up
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

--------------9MHLTxd5KyI0e75n8QNUqiWC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

sorry,

just found that my email filter setting has problem which always store 
cover letter patch to different folder than other patches.

In addition, it looks like patchwork doesn't track comments in the cover 
letter.

This cause I missed you comments.

I will address your comments at next patch.

Thanks,



On 9/27/2023 2:10 PM, Dmitry Baryshkov wrote:
> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh<quic_khsieh@quicinc.com>  wrote:
>> Incorporate pm runtime framework into DP driver and clean up eDP
>> by moving of_dp_aux_populate_bus() to probe().
> Dear Kuogee. Let me quote my response to v1 of your series:
>
> Please use sensible prefix for cover letters too. It helps people
> understand, which driver/area is touched by the patchset.
>
> This is v4 already and the cover letter still has the same subject line.
> If you are ignoring the review comments, should I start ignoring your patches?
>
>> Kuogee Hsieh (8):
>>    drm/msm/dp: tie dp_display_irq_handler() with dp driver
>>    drm/msm/dp: rename is_connected with link_ready
>>    drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
>>    drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
>>    drm/msm/dp: incorporate pm_runtime framework into DP driver
>>    drm/msm/dp: delete EV_HPD_INIT_SETUP
>>    drm/msm/dp: add pm_runtime_force_suspend()/resume()
>>    drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
>>   drivers/gpu/drm/msm/dp/dp_aux.c         |  40 +++-
>>   drivers/gpu/drm/msm/dp/dp_display.c     | 341 +++++++++++---------------------
>>   drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
>>   drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
>>   drivers/gpu/drm/msm/dp/dp_power.c       |  16 --
>>   drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
>>   drivers/gpu/drm/msm/msm_drv.h           |   5 -
>>   8 files changed, 161 insertions(+), 273 deletions(-)
>>
>> --
>> 2.7.4
>>
>
--------------9MHLTxd5KyI0e75n8QNUqiWC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>sorry,</p>
    <p>just found that my email filter setting has problem which always
      store cover letter patch to different folder than other patches.</p>
    <p>In addition, <span><span class="ui-provider ec btp axh btq btr
          bts btt btu btv btw btx bty btz bua bub buc bud bue buf bug
          buh bui buj buk bul bum bun buo bup buq bur bus but buu buv"
          dir="ltr">it looks like patchwork doesn't track comments in
          the cover letter.</span></span></p>
    <p><span><span class="ui-provider ec btp axh btq btr bts btt btu btv
          btw btx bty btz bua bub buc bud bue buf bug buh bui buj buk
          bul bum bun buo bup buq bur bus but buu buv" dir="ltr">This
          cause I missed you comments.</span></span></p>
    <p><span><span class="ui-provider ec btp axh btq btr bts btt btu btv
          btw btx bty btz bua bub buc bud bue buf bug buh bui buj buk
          bul bum bun buo bup buq bur bus but buu buv" dir="ltr">I will
          address your comments at next patch.</span></span></p>
    <p><span><span class="ui-provider ec btp axh btq btr bts btt btu btv
          btw btx bty btz bua bub buc bud bue buf bug buh bui buj buk
          bul bum bun buo bup buq bur bus but buu buv" dir="ltr">Thanks,<br>
        </span></span></p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 9/27/2023 2:10 PM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Incorporate pm runtime framework into DP driver and clean up eDP
by moving of_dp_aux_populate_bus() to probe().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Dear Kuogee. Let me quote my response to v1 of your series:

Please use sensible prefix for cover letters too. It helps people
understand, which driver/area is touched by the patchset.

This is v4 already and the cover letter still has the same subject line.
If you are ignoring the review comments, should I start ignoring your patches?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Kuogee Hsieh (8):
  drm/msm/dp: tie dp_display_irq_handler() with dp driver
  drm/msm/dp: rename is_connected with link_ready
  drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
  drm/msm/dp: move parser-&gt;parse() and dp_power_client_init() to probe
  drm/msm/dp: incorporate pm_runtime framework into DP driver
  drm/msm/dp: delete EV_HPD_INIT_SETUP
  drm/msm/dp: add pm_runtime_force_suspend()/resume()
  drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
 drivers/gpu/drm/msm/dp/dp_aux.c         |  40 +++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 341 +++++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
 drivers/gpu/drm/msm/dp/dp_power.c       |  16 --
 drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
 drivers/gpu/drm/msm/msm_drv.h           |   5 -
 8 files changed, 161 insertions(+), 273 deletions(-)

--
2.7.4

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------9MHLTxd5KyI0e75n8QNUqiWC--
